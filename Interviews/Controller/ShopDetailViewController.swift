//
//  ShopDetailViewController.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class ShopDetailViewController: UIViewController {

    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.tableHeaderView = ShopDetailHeaderView(frame: CGRect(x: 0, y: 0, width: Width, height: Width))
        tableView.register(ShopPayCell.self, forCellReuseIdentifier: ShopPayCell.identifier)
        tableView.register(ShopDeliveryCell.self, forCellReuseIdentifier: ShopDeliveryCell.identifier)
        tableView.register(ShopOrderCell.self, forCellReuseIdentifier: ShopOrderCell.identifier)
        return tableView
    }()

    private let shopCountDown = ShopCountDownView()

    private let shopDetailViewModel = ShopDetailViewModel()
    private let countDownViewModel = CountDownViewModel()

    private let navigationbar = NavigationBar()
    private lazy var navigationView = NavigationController(navigationController: navigationController!)


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setView()
        shopDetailViewModel.bindingStart()
        countDownViewModel.setTimeEnd("2023/10/12 12:30")
        countDownViewModel.bindingStart()

        // Handle Back
        setBackHandle()
        setShopHandle()
        setHomeHandle()
        setCountDownHandle()

        setNavbarTransculent()

    }

    private func setView() {
        navigationView.setInit()
        navigationItem.leftBarButtonItem = navigationbar.setBackButton()
        navigationItem.rightBarButtonItems = [
            navigationbar.setHomeButton(),
            navigationbar.setShopButton()
        ]
        view.addSubview(tableView)
        view.addSubview(shopCountDown)
    }

    private func setLayout() {
        tableView.anchor(top: view.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        shopCountDown.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }

    private func setNavbarTransculent() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    private func setNavbar(backgroundAlpha alpha: CGFloat) {
        let newColor = UIColor.navBarColor?.withAlphaComponent(alpha)
        navigationController?.navigationBar.backgroundColor = newColor
        navigationView.setStatusBarColor(alpha: alpha)
    }

}

// MARK: Delegate
extension ShopDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return shopCell(indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 0:
            print("open panel")
        case 1:
            print("open panel")
        default:
            break
        }

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let denminator: CGFloat = 50
        let alpha = min(1, scrollView.contentOffset.y / denminator)
        setNavbar(backgroundAlpha: alpha)

    }

    func shopCell(_ indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopPayCell.identifier, for: indexPath) as? ShopPayCell else {
                return UITableViewCell()
            }
            cell.setData(shopDetailViewModel.shopData.payments)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopDeliveryCell.identifier, for: indexPath) as? ShopDeliveryCell else {
                return UITableViewCell()
            }
            cell.setData(shopDetailViewModel.shopData.shippings)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopOrderCell.identifier, for: indexPath) as? ShopOrderCell else {
                return UITableViewCell()
            }
            cell.setData(shopDetailViewModel.shopData.pre_order)
            return cell
        default:
            return UITableViewCell()
        }
        
    }

}

// MARK: Event
extension ShopDetailViewController {

    private func setCountDownHandle() {

        var lastHour: Int = 0
        var lastMinute: Int = 0
        var lastSecond: Int = 0

        countDownViewModel.hourCompletion = { [weak self] hour in

            if lastHour != hour {
                self?.shopCountDown.setHour(hour.toTimeString())
            }

            lastHour = hour

        }

        countDownViewModel.minuteCompletion = { [weak self] minute in

            if lastMinute != minute {
                self?.shopCountDown.setMinute(minute.toTimeString())
            }

            lastMinute = minute

        }

        countDownViewModel.secondCompletion = { [weak self] second in

            if lastSecond != second {
                self?.shopCountDown.setSecond(second.toTimeString())
            }

            lastSecond = second

        }

    }

    func setBackHandle() {

        navigationbar.backHandle = {
            print("backHandle")
        }

    }

    func setHomeHandle() {

        navigationbar.homeHandle = {
            print("homeHandle")
        }

    }

    func setShopHandle() {

        navigationbar.shopHandle = {
            print("shopHandle")
        }

    }

}

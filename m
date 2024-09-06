Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5296EF0E
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 11:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0W6H5hZLz309k
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 19:25:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feae::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725614707;
	cv=pass; b=QJIKY2D7CEKgTs5BC6HdF058OHKxHrUQnWdBSfDhba6bR2OrDOrcdhUuE/PEnjlazxlHhc3YyGUfXKtZff5fXukHDijzo/AiNEDvJfK+huNZz14v2YPlth39uCM0wDqvoDrZP6inHjm4qvwP8tgk9G+UT4SlvWlcI6ofUpyZakE/3jeogHn+sbZEB68iaQwHrxEYnKl49mzpdGheWxQ2KgqVDxIMmFvnFpj3/+kJE2ItqJQaMb1/IimGuobsQ+eej29YuCSYDKGJd+2EtZtdkcEefGrs+XR6/1MaoIHMlI01RrGprG9DJal90g2kglWxKTY/tTnRYCEbzf4lkFg6ew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725614707; c=relaxed/relaxed;
	bh=2hI7+xEttF9Yn1v7vJLp69QaRV+Te1Nj2rUrMt/ApZU=;
	h=ARC-Authentication-Results:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:MIME-Version:Content-Type; b=cFlBGUTLMDcjff1HPys+NBwFrNPUAqE70nLYzlu4Ef08ZD6wAEb5A6jJgqUnD1Tulhtt3ormYIY0qRmmLn2IO5wDBUL6Smi3lyY1hEajknHVfHDCkaqU+QPbUdQHI4uJ+5Pemfg78UVG7Q9wmqoUQfG3FTQhGsZii71RtQ75SSaoiIy+MQ4+VvhpSY2RB3pDfJQvx/C2ZwIpJm8sVh+NcCuM760Ip2rGIFMAJnopw9YpyJMmpfIkT6BG8KRlA/T1vWZOnNi6w3ywds9kiHNNo6DNJrQYUT0x0QyMBEOS7e2AmfYXNFwVrfmlTNE6wiSbP1xRoSBjd9lFFjOWRCRznw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=038rEfWG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feae::62b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=038rEfWG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0W6C3Z1jz304l
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 19:25:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIm1QnBLvprcm6H5UQK9AktYsT6noRgSERmdWlPEnR9tN4vYfAkdonbGEiGR4Kd1WVHbmCEZq15GuFQwDRiDhwx6r1lmnQzSwPMVM6JSXcXNOqXu/QWrvb5aI4yZctPkSK4iypncG1c3g+wvNiAaECnwqJ9+1DNdKOhECckG6yjnTI6ZYunAuMrTpbVpeX329V0eI0Nfhz9kcATsmYJncZ891mm80EJZdGB93PTHHqiGV4koGfuwSjN0cB/4ngX8uCRLgMJl5QHWZEFq1aIxCUno02e0W7FAIiQqRDYdogeivgszzLCAC+w1Jj0K9up13u3sVOMFwL9rjiMhoBvkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hI7+xEttF9Yn1v7vJLp69QaRV+Te1Nj2rUrMt/ApZU=;
 b=kzC4Ih2gTkLua6Wduy3QiRK4Cpj6hNMl9x3OCXiKVgZYnvOzLc7rdhDGbtoe3/QMDkSZNOAlMMOxWiKDm4xcyqggsBmfR8OgJ1IRARwUtpwOfsKbVXfdFzswX9PK8WtBuwiL/zzSm82P2zWM6bz5M/e3zS4DmS/rZ52gonbmBRRW8VTz2LutiFo6EH5yPP2Nwka9qpPUgUIJceQ5iqbVYsV3DHANfi1Ri52bXNzA9OVsdUPG6m3JHW5zOg+wSss+urF2wEyOROekazrEbWkWOK7vg66bCNh+kUUwF1gyA7JD++/AdivJRo3CQCdsNKE3D9XuOsU5FWlImIreQ6KhdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hI7+xEttF9Yn1v7vJLp69QaRV+Te1Nj2rUrMt/ApZU=;
 b=038rEfWG8qf4twZaP8nZIJKVC//Ty8P7SvP0zj4OL/HknSNs0s/q/jHarlKCK7gu4r445khgdqLB8v6Ho0L+o/VLa+qDthpSB4fWqNCUINRlNnVKQQkv3tGtqCD7kJH8ghsXhJpIUHZhjb9eagXNCwySYLvtkvd4In4XI8pxtzhu2mq5+kHXQ0cBu4Kx6t93aO1Cp69Z5XacBjlsWjaUcmYmSQmkvHuxjmXxnYGVBQbFFVd0txbjwnDOpNHULCL5u/aw7G0HLP79CNQC0PxLCoDxUs0FeKTylQilEVGZ82W/99jijEJ1UmHbhA1fecNTEJLL3iNRjjgSerE1jhLdvA==
Received: from SI1PR02CA0028.apcprd02.prod.outlook.com (2603:1096:4:1f4::6) by
 TYZPR04MB7456.apcprd04.prod.outlook.com (2603:1096:405:3c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Fri, 6 Sep 2024 09:24:41 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:1f4:cafe::46) by SI1PR02CA0028.outlook.office365.com
 (2603:1096:4:1f4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 09:24:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 09:24:39
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v16 0/3] Add i2c-mux and eeprom devices for Meta Yosemite4
Date: Fri,  6 Sep 2024 17:24:34 +0800
Message-Id: <20240906092438.1047225-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYZPR04MB7456:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 712c8d26-cb06-47cb-51ae-08dcce55bc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?E9d+UFUxyWNGQcUUfZXNCmk9izp7XROozvZK5RKnCgZtLO+f6pJx6ipIuS9X?=
 =?us-ascii?Q?MprqQT8ANkmQy0LYmI0+hqDafcJkPynZIAw+TvTB1MTu/pkx36113TFuS0oI?=
 =?us-ascii?Q?F0lYu3uUkg4uiISxqK5xh0An5irI1M6woH1wztEbF2o31H7bLZEFQWjskxJ8?=
 =?us-ascii?Q?AwtLs5K2OA6pZQN9C2oBDAJ64z3rFHFXrFnxIgNUKMuWUv3Ii7COLPqH2es5?=
 =?us-ascii?Q?L+143G1z1jYbCA/21E4Ns8KqE7Y+mDaLs045keU64Vp7sF6d5wOEn2K53X5u?=
 =?us-ascii?Q?4xwDy0eGbdjcvDt6Ps9GNNE2pVSZjoChZIDOdyEyXkIIH9hpQJ89j9hUohkF?=
 =?us-ascii?Q?k1fhGXCDCsls5BUs6JwKJsZiNNsrxhqy8gD5u/qfW0hAvNrlyTxi18YLlMjX?=
 =?us-ascii?Q?ayAuymV9PL8CsECdUvm5bggnb+XNp0yOO8pTD1GCZw180qT8qVq780KBENVr?=
 =?us-ascii?Q?AmVJ2SUl5hHAmbAvVp8+TXLbzT8XjC6tSVs64q00YA+8hwEmUTLznrsGLDnI?=
 =?us-ascii?Q?Ux+44c4Jc9PeLecuZYqrpMxHBnYe8cXHq2r9cHdYHX6Kt9Z5+IAO6dyNS0gc?=
 =?us-ascii?Q?paHe7xTZtry8HTl/grhmNoWGlIMPfS02XnxYCRDpdVmPB0h8OcngBzHB6o/X?=
 =?us-ascii?Q?YvTvNXdT2oy+Yz/tawtKud1d74kegcDL1aJLMvtuIxxT0JR9yhIAO4yr4Ryq?=
 =?us-ascii?Q?CwUEkJpbjeRO6F9eRowMNA+SC49gGFFmgabadfES7K/E1TYJn67saDqvCOXg?=
 =?us-ascii?Q?88+LgxaAWMOP3+/hlNSwOgDZJ+QrqU05lZvqsWT1HU5ejHoY9hXBZaVPFYBH?=
 =?us-ascii?Q?zsG/5hRmO5gA5bzkR0uhGqu0oLRFlkaEtlevLenOGa2ikg5Mz/LXyDXKECS/?=
 =?us-ascii?Q?AUs0roPDG/AlAFIGKplddcLQoXfSdy8eOYNWZYdc/QA1Aj5U68abAcx+VF5/?=
 =?us-ascii?Q?+KuJEbv4XiGMxxGBh+g85xV5X6Ubk5wT0X6plyeQpd8fmDhsbh08tH3+7Nao?=
 =?us-ascii?Q?wiAd03Mrt+5hO/s565He6jpsvN4s6KO8j0pNzIe/OJWuoZXqnVGOSfSF4XUQ?=
 =?us-ascii?Q?d2tEU6Q+URAuXi4PYkhB4r8Yok+YUp4L4sUgQVqnvS6t9/fvYZNgcc2YPtrc?=
 =?us-ascii?Q?r1qRUhPMFqZcolHJCrKiHDCi7NoOtaU7HvW4G+1rHngSuIImAnahOyWkzI3B?=
 =?us-ascii?Q?Fa+awwR7/V6Y6mhZUz/+0z6SaFDOVp704CWX7PtHsXTscCh19uYhY/6pVx5q?=
 =?us-ascii?Q?v3yqbOqxSOKPimoKi2XKOcIiTUdgli2Nd2edFEdLB5f5sbTRzgavB5Q1X4Wt?=
 =?us-ascii?Q?aGFHM0vNWMyoEzAG2jAyg+xseVELNj3ik8PUZeoxWTB4hUNpHuYtuu0UY2he?=
 =?us-ascii?Q?xfROiNxSNnfv6Vk72A10qZVF+7p+Zb9olJWfLQlnRwDlApO5zwlDLKm8rfnZ?=
 =?us-ascii?Q?e0BpVfmxnHEOu/CwvwbrabwEs+ioGVbq?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:24:39.9851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 712c8d26-cb06-47cb-51ae-08dcce55bc47
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7456
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Changelog:
  - v16
    - Reorganized the patches.
    - Add i2c-mux and resolve the dt-validate errors.
    - Revise Yosemite 4 devicetree for devices behind i2c-mux.
    - Add mctp config and sensors for NIC after i2c-mux on bus 15.
    - Add fan led config for BMC to control according the status of fan.
  - v15
    - Add ISL28022 support
  - v14
    - Add SQ52205 support
    - Add GPIO I6 pin
  - v13
    - Add RTQ6056-support-on-bus-11 
  - v12
    - Fix GPIO linename typo and add missing GPIO pin initial state.
  - v11
    - Revise all GPIO line name with bottom line
  - v10
    - adjust mgm cpld ioexp bus
    - add GPIOO7 name
    - remove mctp driver
  - v9
    - add XDP710 support
    - add RTQ6056 support
    - add MP5990 support
  - v8
    - add fan led config
  - v7
    - Revise pca9506 i2c address
  - v6
    - Revise i2c duty-cycle for meeting 400khz spec
  - v5
    - Support medusa board adc sensors
    - support NIC eeprom
  - v4
    - Re-format gpio linename
    - Revise i2c device node names
    - Split patches by logic changes
  - v3
    - Correct patch for revising gpio name
  - v2
    - Revise mx31790 fan tach config
    - Add mctp config for NIC
    - Support mux to cpld
    - Revise gpio name
  - v1
    - Add gpio and eeprom behind i2c-mux
    - Remove redundant idle-state setting for i2c-mux
    - Enable adc 15, wdt2,spi gpio for yosemite4 use
    - Revise quad mode to dual mode to avoid WP pin influnece the SPI
    - Revise power sensor adm1281 for yosemite4 schematic change
    - Add gpio pca9506 I/O expander for yosemite4 use
    - remove space for adm1272 compatible
    - enable interrupt setting for pca9555
    - add eeprom for yosemite4 medusa board/BSM use
    - remove temperature sensor for yosemite4 schematic change
    - add power sensor for power module reading
    - Revise adc128d818 adc mode for yosemite4 schematic change
    - Revise ina233 for yosemite4 schematic change
    - Remove idle state setting for yosemite4 NIC connection
    - Initialize bmc gpio state
    - Revise mx31790 fan tach config
    - Add mctp config for NIC
    - Support mux to cpld
    - Revise gpio name

Ricky CX Wu (3):
  ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
  ARM: dts: aspeed: yosemite4: add mctp config and sensors for NIC
  ARM: dts: aspeed: yosemite4: add fan led config

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 650 ++++++++++++++++--
 1 file changed, 609 insertions(+), 41 deletions(-)

-- 
2.25.1


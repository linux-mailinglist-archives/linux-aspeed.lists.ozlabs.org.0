Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B01970B5C
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 03:38:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X28c66DzWz2yQl
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 11:38:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::614" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725845892;
	cv=pass; b=lYUoU/ylcevgrclKIBjdlJ2RfarQWAKf8YA+RpxwtBPidxwFdh3uqkoVH6hJXqWWBvWFB7mYpWE/bveUv6eYNlZfyRmmSIfm/+O7SfRLzMk+bmFy5r8Llf9Lzh4mu/9TKMWxqZFtwAvJRNmHSoHmC1KJ62jp86xQXSxnqHtFCFlac0Bw8Ea+WouP+BBnfbPXbu6ncgUIA/3p5yWJ6MqDiSCInD2iI+pcK8Ic4u3yOgvrKOnz7YIS/0Az3hb4TR62rPROaO4NodMWhwViyWgUlMAqQwOYRRL9xfAH+puP6v66CgmplxRRc3f5ZtQa/fJlsbdfGJKHO4kQsE13R3o8HA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725845892; c=relaxed/relaxed;
	bh=GSKMLHOs8VUhnxnP38BE8s8gHfGMSm8vwU9FWBD4ohI=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Type; b=Ly+APp/q1EtOPYjKJRdIpwSwVJCAB79rwLnU7ko54G6Z1EwXp/Z7zOB1N/xvCQstmy9U641jyCwonh1Wp02/ZtKiuPZupuiu5Dz6nO6GUz8s3wtf86mogW3cKVs5KKfz66Y2PBG3hlrjvWd2U0dv/YubHh7xNYMUU5hCuizwu5HHZbqX/64zKiOaW0seKY5ogILErPbnQQI6VUxfl2ZKj3YV4JyZ+IchLuFKEXpaWrno71a4HxaLMlMDD8UuxdUTjMNFXEjnARb3+vMHouPTp5NKGaWLuQhRC+x+NrARVyRw/G6xvOhGESnUhSnOorwbptfq1FpAZC45RU1XayXXsQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YZW7l+Uo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:feab::614; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org) smtp.mailfrom=wiwynn.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YZW7l+Uo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::614; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X28c45dnDz2yG9
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 11:38:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5dtT2TyXb3Pwf7xz8eNlnUPd0/r3Fgjfzt24eImj4EVIhKAFt8Capq9x7WDJLrRLVdtUgputa9aJmuT9n4po7gTG//1i0i0HeMazKzDGnn5DiBVfq6Xf9o7SrGnYhMRfUeukeasD8EzrlJL5Gu9qB2oe4sODxRA0UUc/x7UeoLvnQ0+Hn6I+czitRB5+y7Av25ZlZsiQLxWGQsNzvm2jx2em2dm+2oeIlnXklKDbcqXdZUEpBxj03YCDZhlI0L6TmFRcrA703nW3YPDg1ZDteCCrG0y+yehAJoC1b43/078Er25RXiFzpLp9fU/STigiNof+qVJWhMumCTbhYdsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSKMLHOs8VUhnxnP38BE8s8gHfGMSm8vwU9FWBD4ohI=;
 b=tlnCWLhSBMQSQzOMf57nlGnMfyHlWx12kUrwXO8bAdBUqbTnAMDaP1Z9HjShYxNnxTy1zgXxuNP9X50VRqDiWc3NdKZtsv5hFZvykS4j6JsSn3ShMJMiOwyYe9gHCT7DYCZtj29G1EIn4McBzMDL3W/JuChzIBnttBqaBODG2ej1aq2DKGvoyZqbbkD4fYYFqAdZDqm/khWGgx1vBGnLpS9s4awLWwYK6I13NZni4O/A96FNOn4SF0Zks2okadm5OqgLuPx+Y39v+66z72YdBrqUe/Xj1nwc0ZznKjJ77asidpREOs2Wp/6jPC/GFCyJQF/rL7MQmsHYdo5fMPojlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSKMLHOs8VUhnxnP38BE8s8gHfGMSm8vwU9FWBD4ohI=;
 b=YZW7l+UotJW1oOmVJf33xTIS91DmFkzIj4QN6I/+WPP0WRCRwEhnbrMR0NgLs63hq2BoWXTyJCQoQbLCbniJ7JYM2i1XR3bRzNZG9j1l8efaYSbX2ATl6BKT9oMVGrR/ZwY6IwjtJC3VtKn/eprOQcUFqKoJmblN1fmI4F9emuYeZP89Fd3IoVXvxCvT/6dZv6ilTqt/GVXnfCA8YCjpf4TuQc0TLiPVsKmlxAE5WOl2agpbYtUkbyca08aym+v6JLLtrCCG5rl8S5cOj4TmqZyUQRQ4mIvrDRcZwDAjFQfftDXVMWdl3GhZ3/R3QhvBwVVRl9wYkZxD2DVZ6ASD5g==
Received: from SG2PR02CA0016.apcprd02.prod.outlook.com (2603:1096:3:17::28) by
 PUZPR04MB6160.apcprd04.prod.outlook.com (2603:1096:301:e1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.23; Mon, 9 Sep 2024 01:37:51 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::d4) by SG2PR02CA0016.outlook.office365.com
 (2603:1096:3:17::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Mon, 9 Sep 2024 01:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Mon, 9 Sep 2024 01:37:47
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Subject: [PATCH v17 0/3] Add i2c-mux and eeprom devices for Meta Yosemite4
Date: Mon,  9 Sep 2024 09:37:41 +0800
Message-Id: <20240909013745.3306365-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|PUZPR04MB6160:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7674bcf-5f6f-487b-d0c6-08dcd0700306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?dRwO7mL9ua31fCtt7G7bGGetkhRlVbmIrAJ+7NoB8ARpZlMbrQxw8cKjfSo9?=
 =?us-ascii?Q?aQnt5yJJfUby3nW0fS+e/S16mtNxjEG0SVTbcxLO7Pkp0DxoO8H2ZJ4rc0On?=
 =?us-ascii?Q?4iiWxNXvE5mksDrEiin5ELg3a+N6oZQI22r+n9WjdDzWV+5EEMywWSyWyIsL?=
 =?us-ascii?Q?RQMzvZpe6c20XqM0PLdVU0783ofB/XaIrDQtdCY8GJb7L3wb3cDz70N7XdGf?=
 =?us-ascii?Q?9BJcLdxjx8K+QNIzexU9afKqSKTKyGpf0nr7+nks8b5JXHCiox8P4EXmuVV/?=
 =?us-ascii?Q?gPukzkG0rUXLEmH4XnCDBepW5ChAuEcKZD9P0ADvUty65hvTamWDVjpWbIxk?=
 =?us-ascii?Q?YNXEzbavtQieJP4egpc+apl25G6mAp4iOAYSOubCLbycJKz3lz7ZKSGd4X3x?=
 =?us-ascii?Q?Mme775WXR7DhUt88FOGxsrSLnigDOnJp/fzBJhvoCvh8RgTCsTOfC8ah7b7h?=
 =?us-ascii?Q?AyRgCYVoFDZsIwaFL2IfCzX+LXPtFXvV8HA+bVhIJiX6tUu5Qzbqdv3jQwy/?=
 =?us-ascii?Q?m/9hlOVgZhsqB9Kme1Bn15sc48SoBgS9jMYov8AzNTP9pRQ26G+dHdZZnYeg?=
 =?us-ascii?Q?cV4+1WSDoK5M01aa7eM2ySpzWq1B4gF54VAk2SMkI2BKhyJEcytwq2HP0ngz?=
 =?us-ascii?Q?R4Opewi62+EVyZ1uvQQdef20MUpZ8kmm2yYO7snbYrL7WhGrqT1gt34tAYib?=
 =?us-ascii?Q?NacV+uCIMCdZunfw3I7IMZI6rJPz0MV7YHmStuwPEsM76qc4f75eCUdk8Xtx?=
 =?us-ascii?Q?N1e5+Vvf9ea/v4AhIbHci9PZATqgOWPMod4+XfsFbP8BL9Kc0YaSmXPk5wmU?=
 =?us-ascii?Q?Y3z6/t4We8gCWRi2bioxpClkzhzp0Ivdyqi8RiKCJn2+gfz//lHEjMN+OnR2?=
 =?us-ascii?Q?suu5xz/fu0pvkahuR2pZ+/yyaP3Eh9MmzXfJ/3FrIlS5pmxe4EpWQLZk6yQo?=
 =?us-ascii?Q?P8CQbf1zDpLArnyIUil0WGJDFEudD5M2QdxKUE+qtbF7353bpCaAsrwU+dje?=
 =?us-ascii?Q?QIe2c2/U/nSoCrpHkWysBHqTY1iy7WUafDsO87tfjuhfmWX/2p/j7TWUV56R?=
 =?us-ascii?Q?obbXUQmuhi4iUtl1GQ4xFQnXqVt2EeVp43k6aqb5K1SN5uf6vrrYr66BA5a7?=
 =?us-ascii?Q?CRpn3UlCj7wEfEJP4hNUVrkcsLXS3eSGMu1A0rjLrkoHHsz3lFOf74cBuzlW?=
 =?us-ascii?Q?we9IE8Q8Fdo3oOp10o8YT8I4YUiNwtTrULn/EqJQOQdQN7AWxn+L2WlRLyjS?=
 =?us-ascii?Q?lz602HlrW5VF4dNW6OA+qmls5UsWn3zJN2do8UlGRQZp0HSl8TXx+/rNN2GI?=
 =?us-ascii?Q?Jt+GD8jLXy0s4HWW67n/9a3+RsexgCrhkxUbrOJECQrm6Jaw5AwsBItG/eLk?=
 =?us-ascii?Q?mfh+WbESLfMFMoSbopTz8Y9Zxhm+k3kTm9S993bfBvz+OUfEGSJdlyhDIwX+?=
 =?us-ascii?Q?JC0cnoBGMU75EmEsRkLe+HY2qIO2GH8g?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 01:37:47.9210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7674bcf-5f6f-487b-d0c6-08dcd0700306
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6160
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Changelog:
  - v17
    - Add SoB for the patches.
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

 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 676 ++++++++++++++++--
 1 file changed, 634 insertions(+), 42 deletions(-)

-- 
2.25.1


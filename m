Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CDA99250A
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 08:40:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMV0B2nwKz30NN
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 17:40:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728283241;
	cv=none; b=k50/MYS1UJgz+Msy32E0b4ITVU6yUCGBINqQNxuMSQ4cDX0cdk5HfDU2Jk6MEBuQ2eeg/DMDFQ+rqd2DbvsJkw4bbZ7zPC9bfpO4K8s3UaDcvSyXMsuLX3wz0YOOP9dgpGSLqhHhKWWMJpYviaydMftEt/aGwwEWNeY+8nKburNrykiqTNr1khhbS0XO5AjSVmToOygDM3l0Gc4N1mkifT2zikFWHCELncZdPATtrxwWPT5eF7sg5Rq5efV7lYJYy4G7n0Aq1eYxVBXAx9km/NHR2QBTaoLF1ENE01uX/ErKGC8k5XONCP3f1yM+DsZRZOMICOCtXeUMU3fr5/DXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728283241; c=relaxed/relaxed;
	bh=ojalM83DjphcLdNrnYSnK4SosjeiN3Ofq00L9IA3ke4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V6TL5/oZBPGSpgVP3ZgOpDUGKo5CREu0e/+9mkhXrS6iBkzIpP6auXl5Kl2GowIlIx25CM+kK3j4OLufB7s9HK7wjRFVUbLBD53+wBiyQFyY6JaLPjURGgyvPQJ+5vz5qhx+fiAnAn4rqgk2XYwHVXtwpjilhr/82L1SNUmwELUicfbKfL8Ie9d+GYU2Cb6u5JsinpUqrlurd4XUpql3v2mBzHpqrdc/N4ve6Wwiv1CZcC2YTL1pW38cM24+Kt7yCoaVvRDKJjF5TEGeGzLoZDLdhbnsGHaFGGHGI3ytfYToSHoQb9vYa5O9kxGCJ+X94tR7dBGBeNh2z39FyxaWKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMV080y49z2yY0
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2024 17:40:39 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 14:34:08 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] [PATCH 0/4] Update ASPEED WDT bootstatus
Date: Mon, 7 Oct 2024 14:34:04 +0800
Message-ID: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com, Bonnie_Lo@wiwynn.com, Patrick_NC_Lin@wiwynn.com, DELPHINE_CHIU@wiwynn.com, Peter.Yin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series inherits the patch submitted by Peter.
https://patchwork.kernel.org/project/linux-watchdog/patch/20240430143114.1323686-2-peteryin.openbmc@gmail.com/
Besides, the boot status modififed in the WDT driver
obeys the rules proposed in the OpenBMC.
https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-update.md#proposed-design
Moreover, WDT SW reset is supported since AST2600 platform
and is also included in this patch series.

Chin-Ting Kuo (4):
  dt-bindings: watchdog: aspeed: Add property for WDT SW reset
  ARM: dts: aspeed: Add WDT controller into alias field
  watchdog: aspeed: Update bootstatus handling
  watchdog: aspeed: Add support for SW restart

 .../bindings/watchdog/aspeed,ast2400-wdt.yaml |  11 ++
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi       |   2 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |   3 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   4 +
 drivers/watchdog/aspeed_wdt.c                 | 149 ++++++++++++++++--
 5 files changed, 160 insertions(+), 9 deletions(-)

-- 
2.34.1


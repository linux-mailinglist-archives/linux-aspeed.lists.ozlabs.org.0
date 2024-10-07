Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D335D9924EF
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 08:35:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMTtd6fy4z304C
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 17:35:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728282948;
	cv=none; b=Dzwyo2LwhWU1AaSav8nUO1znlRj37iw1r9HhEiYMKG4h/FlDCMBtY+EzNcFgYmuj3w/z2sFqEGiSUJfKHADCsAmiRpARJKDZruFip/s2Hm067C1chovAk5r7Do452Z4FR7g4rAfUWSlEXUAMHdmS4dkogUkl8LgPV7xppBFd3yuaimvRFu2/ibQPmCDVBQpHwmfm7PXCCzm2Pde/GoZHEKlGyoPNZ38hqAdDxnTZZY/y5qzy0xZN7s4ygcgGmLApxcncw6LnMuH/tSZ9UWLubMn655BzzWHFwEsHSC0ZwSuN/0Si9ZAGLSSC+NvDCgUa5lfgV+1kuLBVFP72Vpbgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728282948; c=relaxed/relaxed;
	bh=+qnT/VJPfq/wikjmpBAQism7qboXf+iSdeubgEuKVlc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F9rPmQeog9KR3Nz2vYF7kuqIeEdM33wGadSAoVSdiIuRU+2pbwvOTfycv4nKzrHfDOUlciSkEuh8UjfNTb+Lnnh4E+xSybrZp84S3epexpbFK6PL1380Q5Y9npqw9qPGco5WSBPe7W5evvbyKfXNhDG/ejrCU1ECjEEYtayiV2uVTyu2ZoaYJ+U1uMA102MgISIMVS/XkA7wz7uiHCxNUPuzVuj+1bKDKNOO28E26YdLKq8j4IlbUpUSUvgCNdI8J5Q8i6zhzfEjpZBD3YC4v9v4hloRDxAxOEKcGQJEs0oiTPZOlFDcEYqshf7Luiex2a1IL+jEkZk6pSxkO5jWWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com; spf=temperror (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMTt44RMTz2yVt
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2024 17:35:04 +1100 (AEDT)
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
Subject: [PATCH 2/4] ARM: dts: aspeed: Add WDT controller into alias field
Date: Mon, 7 Oct 2024 14:34:06 +0800
Message-ID: <20241007063408.2360874-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
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

Add WDT controller into alias field. After that, WDT index,
used to distinguish different WDT controllers in the driver,
can be gotten by using of_alias_get_id dts API.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 2 ++
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 3 +++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index 78c967812492..d8b4136d0ca0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -29,6 +29,8 @@ aliases {
 		serial3 = &uart4;
 		serial4 = &uart5;
 		serial5 = &vuart;
+		watchdog0 = &wdt1;
+		watchdog1 = &wdt2;
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 57a699a7c149..4dd220bca617 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -30,6 +30,9 @@ aliases {
 		serial3 = &uart4;
 		serial4 = &uart5;
 		serial5 = &vuart;
+		watchdog0 = &wdt1;
+		watchdog1 = &wdt2;
+		watchdog2 = &wdt3;
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 8ed715bd53aa..c0a47c795fff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -40,6 +40,10 @@ aliases {
 		mdio1 = &mdio1;
 		mdio2 = &mdio2;
 		mdio3 = &mdio3;
+		watchdog0 = &wdt1;
+		watchdog1 = &wdt2;
+		watchdog2 = &wdt3;
+		watchdog3 = &wdt4;
 	};
 
 
-- 
2.34.1


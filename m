Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7CE8BCC75
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 May 2024 12:57:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXyyz3428z3cDV
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 May 2024 20:56:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=dylan_hung@aspeedtech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 315 seconds by postgrey-1.37 at boromir; Mon, 06 May 2024 20:56:52 AEST
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXyyr3mfdz30Np
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 May 2024 20:56:51 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 6 May
 2024 18:51:20 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 6 May 2024 18:51:20 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <jk@codeconstruct.com.au>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 0/2] [RFC] i3c: ast2600: Add MCTP-over-I3C support
Date: Mon, 6 May 2024 18:51:18 +0800
Message-ID: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add Aspeed AST2600 I3C controllers and add minimal changes to validate
the functionality for MCTP-over-I3C.

Dylan Hung (2):
  [RFC] ARM: dts: aspeed-g6: Add AST2600 I3Cs
  [RFC] i3c: ast2600: Validate AST2600 I3C for MCTP-over-I3C

 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 137 +++++++
 drivers/i3c/master/ast2600-i3c-master.c | 137 +++++++
 drivers/i3c/master/dw-i3c-master.c      | 513 ++++++++++++++++++++----
 drivers/i3c/master/dw-i3c-master.h      |  12 +
 4 files changed, 718 insertions(+), 81 deletions(-)

-- 
2.25.1


Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB93557C
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 05:02:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JYVy08ZPzDqRG
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 13:02:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JQPS6v2kzDqV8
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2019 07:42:18 +1000 (AEST)
X-AuditID: ac10606f-bbfff70000003de9-15-5cf6e5b10449
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 B1.12.15849.2B5E6FC5; Tue,  4 Jun 2019 17:42:10 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 4 Jun 2019 17:42:09 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Linus
 Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3 linux dev-5.1 arm/soc v2] ARM: dts: aspeed: Add SGPM pinmux
Date: Tue, 4 Jun 2019 17:42:04 -0400
Message-ID: <1559684524-15583-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPLMWRmVeSWpSXmKPExsWyRiBhgu6mp99iDLad47PYdZnDYv6Rc6wW
 v8//ZbaY8mc5k8Wmx9dYLZpXn2O2uLxrDpvF0usXmSxa9x5hd+D0uNq+i91jzbw1jB4XPx5j
 9ti0qpPN4861PWwem5fUe5yfsZDR4/MmuQCOKC6blNSczLLUIn27BK6Mvo5ZzAVrWCuaO+Yz
 NTCuZ+li5OSQEDCRuHG1jxnEFhLYxSRxewNjFyMXkH2IUeLP0k6wIjYBNYm9m+cwgSREBHYw
 Slz98QysillgPaNE466tjCBVwgL+Eo/fTgSzWQRUJKbf/MEOYvMKOEjM37iGFWKdnMTNc53M
 EHFBiZMzn4BtYBaQkDj44gXUGbIStw49ZoKoV5B43veYZQIj3ywkLbOQtCxgZFrFKJRYkpOb
 mJmTXm6kl5ibqZecn7uJERLI+TsYP340P8TIxMEI9BIHs5IIb+LtLzFCvCmJlVWpRfnxRaU5
 qcWHGKU5WJTEeVet+RYjJJCeWJKanZpakFoEk2Xi4JRqYJyat2VV6s9lL3fo6G/vlpuVzLMg
 Y8fVRx0T+LVz+P+sULxYP2fVzAOyW2sMfp9r27qgajnPqtrkIO2Tfwqz7kSyflI+9ftQyfqp
 O482Gfrfv7CCdevX3gyHuocKbGKB2nlVQr7eVb1Lj17141eIjNt05rnP23PG/YcnHD78g2eP
 mMP9tbkTSrKUWIozEg21mIuKEwHBh/8yUgIAAA==
X-Mailman-Approved-At: Wed, 05 Jun 2019 13:02:07 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Hongwei Zhang <hongweiz@ami.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
supporting SGPIO in AST2500 SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 85ed9db..8d30818 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1321,6 +1321,11 @@
 		groups = "SDA2";
 	};
 
+	pinctrl_sgpm_default: sgpm_default {
+		function = "SGPM";
+		groups = "SGPM";
+	};
+
 	pinctrl_sgps1_default: sgps1_default {
 		function = "SGPS1";
 		groups = "SGPS1";
-- 
2.7.4


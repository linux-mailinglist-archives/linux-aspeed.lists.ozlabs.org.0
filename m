Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6A34D0CD2
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 01:36:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCGbJ5xH7z30gg
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 11:36:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=HCzFbpPf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=HCzFbpPf; dkim-atps=neutral
X-Greylist: delayed 183 seconds by postgrey-1.36 at boromir;
 Tue, 08 Mar 2022 11:36:05 AEDT
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCGb961SJz2yQK
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 11:36:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646699767; x=1678235767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMjDuD5QVz9yQTqyFCo02zQZPRqFSAMCtKG5upULYGQ=;
 b=HCzFbpPf9Qj8vAm5JI5OfjFRjSstAqu82tgXJtb9oJ6g6vjSqQ1wDI4k
 V8GYP+0Xo9XxZvgMrROi5qLxnFxgpRdHZpDhAvkYPeKU6tmk2P9eOKzr9
 OB5QmxD/RZnQNQfRazxT+qZeUHqYg7Aa748cO+Z5V1nZtdge+BifNHmtX A=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 07 Mar 2022 16:31:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 16:31:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 7 Mar 2022 16:31:59 -0800
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 7 Mar 2022
 16:31:57 -0800
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: aspeed: Add FWQSPI pinmux
Date: Mon, 7 Mar 2022 16:31:36 -0800
Message-ID: <20220308003136.3930466-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Johnny Huang <johnny_huang@aspeedtech.com>

AST2600 FW SPI quad mode only need to set AE12 and AF12, no need
to set Y1~Y4. FW SPI cs, clk, mosi and miso pins are dedicated.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 54064714d73f..80838dc54b3a 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1236,12 +1236,17 @@ FUNC_GROUP_DECL(SALT8, AA12);
 FUNC_GROUP_DECL(WDTRST4, AA12);
 
 #define AE12 196
+SIG_EXPR_LIST_DECL_SESG(AE12, FWSPIQ2, FWQSPI, SIG_DESC_SET(SCU438, 4));
 SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
-PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, GPIOY4));
+PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
+	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
 
 #define AF12 197
+SIG_EXPR_LIST_DECL_SESG(AF12, FWSPIQ3, FWQSPI, SIG_DESC_SET(SCU438, 5));
 SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
-PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, GPIOY5));
+PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
+	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
+FUNC_GROUP_DECL(FWQSPI, AE12, AF12);
 
 #define AC12 198
 SSSF_PIN_DECL(AC12, GPIOY6, FWSPIABR, SIG_DESC_SET(SCU438, 6));
@@ -1911,6 +1916,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(FSI2),
 	ASPEED_PINCTRL_GROUP(FWSPIABR),
 	ASPEED_PINCTRL_GROUP(FWSPID),
+	ASPEED_PINCTRL_GROUP(FWQSPI),
 	ASPEED_PINCTRL_GROUP(FWSPIWP),
 	ASPEED_PINCTRL_GROUP(GPIT0),
 	ASPEED_PINCTRL_GROUP(GPIT1),
@@ -2152,6 +2158,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(FSI2),
 	ASPEED_PINCTRL_FUNC(FWSPIABR),
 	ASPEED_PINCTRL_FUNC(FWSPID),
+	ASPEED_PINCTRL_FUNC(FWQSPI),
 	ASPEED_PINCTRL_FUNC(FWSPIWP),
 	ASPEED_PINCTRL_FUNC(GPIT0),
 	ASPEED_PINCTRL_FUNC(GPIT1),
-- 
2.25.1


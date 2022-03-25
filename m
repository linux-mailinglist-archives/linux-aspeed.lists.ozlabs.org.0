Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB04E7823
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 16:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ5th12Tmz306D
	for <lists+linux-aspeed@lfdr.de>; Sat, 26 Mar 2022 02:42:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=pr/EQCDB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=pr/EQCDB; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ5t74VBmz30Bw
 for <linux-aspeed@lists.ozlabs.org>; Sat, 26 Mar 2022 02:41:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648222895; x=1679758895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Gg6P7v343oev4CrSeurL6DtG0komuKyQ42meeHE/08=;
 b=pr/EQCDB8EwE+WaR6p9J5Dbb79GF8hntI114UcoqpweleWpO+Q2goaKU
 M7f9nTCkB/CHep/Eb4/ASdFXVVoYwDV4RW3CX4rmztWmxZYngZ4euJduH
 czTUTb567JyPjxpGXjKA8BoaqE7gwUvTFk10vRf4v9nucu/YNzNzkVn90 Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Mar 2022 08:41:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 08:41:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 25 Mar 2022 08:41:33 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 25 Mar
 2022 08:41:31 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 3/5] pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
Date: Fri, 25 Mar 2022 08:40:46 -0700
Message-ID: <20220325154048.467245-4-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Add FWSPIDQ2 (AE12) and FWSPIDQ3 (AF12) function-group to support
AST2600 FW SPI quad mode. These pins can be used with dedicated FW
SPI pins - FWSPICS0# (AB14), FWSPICK (AF13), FWSPIMOSI (AC14)
and FWSPIMISO (AB13).

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
 * None.

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


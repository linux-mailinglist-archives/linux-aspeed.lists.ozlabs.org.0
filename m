Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F674D0CE0
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 01:40:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCGgw1GLGz3bPD
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 11:40:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=rUF5qSN5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=rUF5qSN5; dkim-atps=neutral
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Tue, 08 Mar 2022 11:40:04 AEDT
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCGgm3kW0z2x9b
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 11:40:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646700005; x=1678236005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AFspTufxnZFR9Evdcdu/mYretERNYjS/iMbuOXoxi6M=;
 b=rUF5qSN5qyOb/czUCfC7g3T0y+vh6d6h67hu8QHlCr8+PG6Docq1J4bS
 m42tZ6kdxTI9GJeRaJ3WqBnhOpFLXOtjEzoM8P9BUzGtPET34PQp19OPL
 RXq5qh6nR2U1PpeyjfjfI2ElCXdhbuJ7+CvsOOvFn4GIMc3zQ0FQ8EKqT g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Mar 2022 16:37:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 16:37:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 7 Mar 2022 16:37:56 -0800
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 7 Mar 2022
 16:37:55 -0800
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] Fix AST2600 quad mode SPI pinmux settings
Date: Mon, 7 Mar 2022 16:37:40 -0800
Message-ID: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

I’m sending this patch series to fix current issues in AST2600 pinmux
settings while enabling quad mode SPI support.

FWSPI18 pins are basically 1.8v logic pins that are different from the
dedicated FWSPI pins that provide 3.3v logic level, so FWSPI18 pins can’t
be grouped with FWSPIDQ2 and FWSPIDQ3, so this series fix the issue.

Also, fixes QSPI1 and QSPI2 function settings in AST2600 pinctrl dtsi to
make it able to enable quad mode on SPI1 and SPI2 interfaces.

With this series, quad mode pinmux can be set like below.

FW SPI:
&fmc {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_fwqspi_default>;
}

SPI1:
&spi1 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_qspi1_default>;
}

SPI2:
&spi1 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_qspi1_default>;
}

Please review.

Thanks,
Jae


Jae Hyun Yoo (3):
  ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
  pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl dtsi
  ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group

Johnny Huang (2):
  pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
  ARM: dts: aspeed-g6: add FWQSPI group in pinctrl dtsi

 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   | 10 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 17 ++++++++---------
 2 files changed, 13 insertions(+), 14 deletions(-)

-- 
2.25.1


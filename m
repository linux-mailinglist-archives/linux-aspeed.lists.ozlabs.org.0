Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158954EB2DB
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 19:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KScLJ6fCCz2xfP
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:41:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=v2opZ3NY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=v2opZ3NY; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KScLF3sPwz2x9v
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 04:41:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648575670; x=1680111670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L9a82y/lcvJzSe4xQ687SKzEc2I5M+TduJKXm5ghFVg=;
 b=v2opZ3NYNm9cDnZTxKtKrEizwMMYmZvgdhfztQ69JOIOK/tqNK9el1eE
 sfses9PL15agz28RU0R1D/Tk4cIO1PgsjFQnaDEe6T+zkjkiZWnVs2K9W
 DrtOkxWStPfx2LZsLGdHju6ofEaB+pNxCPKPjM7znsZoUHLWk0fN1qb4J Y=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 29 Mar 2022 10:40:07 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 10:40:06 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 10:40:06 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 10:40:05 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann
 <arnd@arndb.de>
Subject: [PATCH v3 0/7] Fix AST2600 quad mode SPI pinmux settings
Date: Tue, 29 Mar 2022 10:39:25 -0700
Message-ID: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
&spi2 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_qspi2_default>;
}

Please review.

Thanks,
Jae

Changes in v3:
 * Added bindings patches. (Andrew)

Changes in v2:
 * Rebased it on the latest.

Jae Hyun Yoo (5):
  ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
  pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
  dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
  dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
  ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group

Johnny Huang (2):
  pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
  ARM: dts: aspeed-g6: add FWQSPI group in pinctrl dtsi

 .../pinctrl/aspeed,ast2600-pinctrl.yaml         |  4 ++--
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi        | 10 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c      | 17 ++++++++---------
 3 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.25.1


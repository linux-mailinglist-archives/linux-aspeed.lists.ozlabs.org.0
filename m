Return-Path: <linux-aspeed+bounces-1430-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E0AD8252
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Jun 2025 07:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJSCy6Dxgz30Qb;
	Fri, 13 Jun 2025 15:11:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749785425;
	cv=none; b=nKnOwF6cBY+qak4qSjtX9iNjtShyN62MGE2TgP0FrdMAb9xYRTprca50OzYnCWRYLzBIC1DKRJAw3v9f0GoyzIOdZO5QWHokV0JEPbCmTF32Mg38SHc6R+DZ+9FA57QKDKQluHXuXeVakoiQPPQG4YkMhVE6Y+nZSccBOreZkuBtuzsprEIclTmnF4NJdNBaZcAMl0AHGnw9/utyh29jR8ACeUA9LMw0FfXlOxTyVBo3BfBO0lYycTRQ/DZMfWIJy+eaf+NtlUE8eIuWi7Iu8yQU0FfMvyOPMJrzQmtLYnsjyP7TPjfZIicMqe5BXd8BBnfXZ94HIyChdFOwfEUIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749785425; c=relaxed/relaxed;
	bh=cm0i6X2961Akf+Ls+i0/k+ZjUPURiX4Nw6tGye1S4Nw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cEdnYRexYf8JlCumgH2Oa23oYW/RR5ChX/BjuDBlMCzEQvvHNkWLuksobNIDvMxyDIL2GukvifWD29e0di7q8sEnJLsXA+2Tc+ICsJEVQ9BuIcOWNd5AdEEhJT6zE1OyoFk+Cs8JRLJllgas+sFnZyH2o941Eqo9Z5tsLesZdjpzMt68TKEMl4mdqh3cnMyCCf5ROJ3Mb7APSuiSpksHBnHrVbPX6tn+WUEubf79aORa4Z4shhWDiljR+Wf0aoPQOnlM3SGZ2j9of9t/H+xudb6If8TR5pE9a2H59y2Pet+E0mCGedmWbUfjVf/cLSFLdWO5tohAEvv8enYD+uL+xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJPzh4HtWz2xKN
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Jun 2025 13:30:24 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Jun
 2025 11:30:02 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Jun 2025 11:30:02 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <elbadrym@google.com>, <romlem@google.com>, <anhphan@google.com>,
	<wak@google.com>, <yuxiaozhang@google.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 4/7] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST ctrl pin
Date: Fri, 13 Jun 2025 11:29:58 +0800
Message-ID: <20250613033001.3153637-5-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add pinctrl support for PCIe RC PERST pin.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index 289668f051eb..a93e15c64a4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -2,6 +2,11 @@
 // Copyright 2019 IBM Corp.
 
 &pinctrl {
+	pinctrl_pcierc1_default: pcierc1_default {
+		function = "PCIERC1";
+		groups = "PCIERC1";
+	};
+
 	pinctrl_adc0_default: adc0_default {
 		function = "ADC0";
 		groups = "ADC0";
-- 
2.43.0



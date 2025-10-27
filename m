Return-Path: <linux-aspeed+bounces-2625-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84152C0CCFD
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Oct 2025 10:59:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw8905tgVz3btg;
	Mon, 27 Oct 2025 20:58:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761559124;
	cv=none; b=CzIqRvsswVxD/zQLImQi6dPm/ARxRNwiX9hv7BBC94Ojj6yu6MOjNoo+iE0x1+LAPgil/FKycXfzLK/CfB/KDpMVz+22AVu0uFzQHbi1W7S+yZgihoWSPli/ksNyu1/4FDliONVzlMDM7VKrMh6vWJ+eFwM13o1edbtXyk510/VmN8AKAiiIZ3wmRHOstAL21zKZp6uTOlAPsGwBOEYCNM5AAywzJvML2QqZMayt0ON3m4E63Fjpgt5kpsWu8u6quxQ5g1ME0CEMFVnyGyJrbdlcQ+TWCgXe/IEaTcUbhN2WbLA8u06vlQzfkXHX3woh2W4fvJZkJNMEJdY/aIMiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761559124; c=relaxed/relaxed;
	bh=rq+1y790pe0Cfp13+HuuVfB9eKgP7oyWGnOPXBOPhA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ncPz9o+RH/BeWEa2gCfUkB3cnHc/kfIoJyrHXe7sbM+gres2iiBtgXxDDjje2Rud/WleeXYz1yAqd1LLXuo1nyWFvyM18ZJ0J/fPW+bXUL+K4qIk7xHkMFAaLEaxHXTTQAHZr3ymakIdGBtltWLTYJYzv26FA5nYfyOvGb9LQC08tvpaWD0I5bY38aBffpMPKiwjxmnnhqWVdVPV3pXKJkZHT5NooeZ9bpJyCqJtyznPoUA9D5mOAH/6xNbhHCGIP1Qq9Dyl3VaEXYYUSCnjXAWev+WsDBkCBRNBvhQNLBXVv6J5YcPex6CFyXwaiOPDjcfMv2bJvwfUZ45UK6B3qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw8902F6xz3c1T;
	Mon, 27 Oct 2025 20:58:44 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 27 Oct
 2025 17:58:25 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 27 Oct 2025 17:58:25 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/9] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group
Date: Mon, 27 Oct 2025 17:58:19 +0800
Message-ID: <20251027095825.181161-4-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
References: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
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

Add PCIe PERST# group to support for PCIe RC.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 80974c46f3ef..af8979af9b45 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -141,6 +141,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1
@@ -369,6 +370,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1
-- 
2.34.1



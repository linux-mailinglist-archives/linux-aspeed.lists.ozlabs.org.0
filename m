Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4863250EE90
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 04:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQPV13d9z2yPj
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 12:12:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e5/VJ4uw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e5/VJ4uw; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl9zz1RLkz2yn9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 20:45:49 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id l7so15627923ejn.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HE//HcQTXFALh6mE2wSN/v3f/KXxXJCpEOZ5pIZr4hY=;
 b=e5/VJ4uwjeEhiUDjL6Ro+kDSkXiKb18cIXdxJsgc9MfJ3kSMHDqpOjVws7MfyYMItP
 l7dfyU48/9yznSA611fHOqCN5jmwFasrttXsMVnHGH3Go2SPSw/NDk38rF6BJJE3PA98
 Q9aXDR+2Dy0BKEwHsrvGGCCXzDYQutoeQj13k43CJwL4OUox7D+BpQpErL2bzO4Y3RFa
 VbZlXOY0AGWAMIjskiP3aUih8nWm8F7mJu1CsC7IHTDBAn4O0X+jyEd2jPugwxq0LhSv
 5XKQp9Ra8YQYIYnfrM5xSjVJ1p60b8uZvw/Lr8Ix0MjhKdOudMEt9tVV1c/zgzLaPBSv
 5Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HE//HcQTXFALh6mE2wSN/v3f/KXxXJCpEOZ5pIZr4hY=;
 b=RwennYIObZqXfGmw0VTXTIKBRBL4D51uFOWlTuMQiyZVR7Llude0lmHsgDPHXlG5xM
 6jlJnQW/MAOAKgrbyDVW7PuNKAM3J9YLV3JwOmoPhCKcQaIotS2azYw1oJHi1Of+T8hm
 nRZHHMVPadVwRxHW25mhqZq0cX8C6PDh/wtm88O8xibJsGqlDWBMRzDecs2VL0JRjcf6
 ojutKadzYaDKEzJWAN4KIJRMfUB9HMsSQjre5UWFqOOJw4MYf9SM+eTqKXNq4PCtWFNe
 bZNKu/TnYpz/cQExqITjBfW4c6ixB7O6zenHcT566XmNt6fK2QOLIxypPdMxDU32Iazj
 T6tA==
X-Gm-Message-State: AOAM532JY1HFD824QC0iQ7MKIk4nXrTNVBuDuWuOiT30ftFGoyUssFMY
 aMDWK3l2XKafkQvcaIDY84dacA==
X-Google-Smtp-Source: ABdhPJx39u9MWyPfP66DFZ7RmPDZDn+dQyvSAT/UY9njPtByzeZizvvoyz2vh1Iv+uTdK1xL8PcpXA==
X-Received: by 2002:a17:906:2bd4:b0:6e8:7e5:39b6 with SMTP id
 n20-20020a1709062bd400b006e807e539b6mr3516862ejg.25.1650624340194; 
 Fri, 22 Apr 2022 03:45:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 cn27-20020a0564020cbb00b00418b0c7fbbfsm744502edb.32.2022.04.22.03.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:45:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 1/2] irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map() return
 value
Date: Fri, 22 Apr 2022 12:45:35 +0200
Message-Id: <20220422104536.61451-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:21 +1000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: f48e699ddf70 ("irqchip/aspeed-i2c-ic: Add I2C IRQ controller for Aspeed")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/irqchip/irq-aspeed-i2c-ic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index a47db16ff960..cef1291ae783 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -77,7 +77,7 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
 	}
 
 	i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
-	if (i2c_ic->parent_irq < 0) {
+	if (!i2c_ic->parent_irq) {
 		ret = i2c_ic->parent_irq;
 		goto err_iounmap;
 	}
-- 
2.32.0


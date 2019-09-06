Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D66AB26C
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 08:26:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pncz11hMzDr7g
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 16:26:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ADimNP2N"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pncm2ShWzDr7F
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 16:26:00 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id 4so2614011pld.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 23:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRxcumHCoieD4YHhJDBwA9IBTCoCwLTVhc9o3nRRDkI=;
 b=ADimNP2ND3VOH2ln0p+yNfF/DGU2qkBipN72ljAr/PczQvTfbrKsX07vY8Zdwngoar
 LhdZEUosmuWvZxdURnHwN7oYANLXkw1O7D6cD5OJp5+/tCkczEX/nk5v6+w2CXfSDCk9
 L8eHl7xI6P/RcTjbsUVJuQNkq6YLcLN6H3OV6ApvAePbpWSpsOyYEqqqvMNYFtcxKvQR
 cbG2R/hIbwiZcQaSbzwjgw2yVtC0T4zgOKxeF049FwRTUIo7ETmaEAstIajleYpZtZKM
 C42BxBvR8hUAH8v2LxsxzjNdxPxoxqeK2II8PyPVrsFPJubqbesfhTTe9RIflLXv6b83
 6QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRxcumHCoieD4YHhJDBwA9IBTCoCwLTVhc9o3nRRDkI=;
 b=VlB7wr5c0Eh/z8/tIdGMD3AU6v4pRYQbnPOBWIdsmZqgif6HAEwGqjewWXcINGPub4
 E2CKSby1N2AQhX7v0t0VBD0PJ05Z6sVQgY4phkmPbDiiKEAZg2sQ7+ohTYTU+lI0EPUe
 WPjGa0T8Zk24r+wecryxMMbfctYVDUrpL30pp2l962FFI3QXvl7feG37/03DZ+SFaRNn
 2onCEROYKhhr92mHZesRwm4OWibOAXIjFAHaFUcBAWSzklzc3Q3vxJEDtyNKpZ2TfWO2
 BgmO5N2KPihZoxw0zONwjIyF9AjZ5OFHuCRge01nO15ybY/3gGUsxlKw1FGrkF5ItwEp
 Qmig==
X-Gm-Message-State: APjAAAX42C+yQHBoI3YrNI5UXkOmOYn3W+ZlVWbKcSttqnnYC47LOQz0
 q1uG70ryia0rNUr0hmVQlcM=
X-Google-Smtp-Source: APXvYqxAHm7TEMjvZZG+IKwNgVMQW4iXvRHQ3UYm4fIeZ5CGft2zoBZMr3vCIp78S9acysQdbufG3A==
X-Received: by 2002:a17:902:748b:: with SMTP id
 h11mr7587383pll.269.1567751158029; 
 Thu, 05 Sep 2019 23:25:58 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y192sm6244998pfg.141.2019.09.05.23.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 23:25:57 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v3 1/5] dt-bindings: gpio: aspeed: Update documentation with
 ast2600 controllers
Date: Fri,  6 Sep 2019 16:25:47 +1000
Message-Id: <20190906062547.13264-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
Additionally, it has a GPIO controller for 36 1.8V GPIO pins.  We use
the ngpio property to differentiate between these controllers.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 7e9b586770b0..b2033fc3a71a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
 -------------------------------------------
 
 Required properties:
-- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
+					or "aspeed,ast2600-gpio".
 
 - #gpio-cells 		: Should be two
 			  - First cell is the GPIO line number
@@ -17,7 +18,9 @@ Required properties:
 
 Optional properties:
 
-- clocks                : A phandle to the clock to use for debounce timings
+- clocks		: A phandle to the clock to use for debounce timings
+- ngpios		: Number of GPIOs controlled by this controller. Should	be set
+				  when there are multiple GPIO controllers on a SoC (ast2600).
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
-- 
2.20.1


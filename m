Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C79C79705E
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Sep 2023 08:52:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KnHO0pn7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rh90d1HcTz3bYx
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Sep 2023 16:52:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KnHO0pn7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rh90X2fmGz3bts
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Sep 2023 16:52:28 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a751d2e6ecso436181b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 06 Sep 2023 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694069544; x=1694674344; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrZo7tIMdoMbzOPcfOzJ/GpkMVwTtgFYIxMTU1F66OU=;
        b=KnHO0pn7cg/iJI+9PfaO3JHsGHe2cxHPH7hWsCzgGKSwrVTtVKdNxbEu3r807wcrvD
         LPFJi0bXVtOTilXPeoeDWxIjLvDKuV2ecdiadOBNw+eLJDuJ5XBzsXnViWaWsdUEwI8b
         B5rWZAleyWYJXNOw8t7pvXGj23RVsYNn+lykMoOxkbYmoNXhq7kUC4rzH8akoo0x7LjA
         xAniuP3xGkckE+2iPZIJfy5A2o4XsuKaLVN2F0z16aZfw/aDVwxYfVofGgWg9ygCAanC
         F2lETZVGusSnsirgnZiY4UNgVXLdIrmC6A6Z1tT5O3halFlvaNKiPcTGOZ96/ORUAQmH
         F+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694069544; x=1694674344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrZo7tIMdoMbzOPcfOzJ/GpkMVwTtgFYIxMTU1F66OU=;
        b=Jb6creJORgEr/SqpICN8unh/s++PLmwj0juG4x/WqHGy7lhirN3oMZbZ0WZLf3RnA6
         OFhXurYjBGTIs5PdzgNGKTaX0UlrCAdt4uW0SQt4OABtE2U+q0b9vp4n3Ack+atEWGMh
         e2yzVMHmocuW5RKbdFE+5/xCh41Cf6EHXuHuo8ghoQ5xeWmhQuesdEZRC2piQOSfNiCu
         8eC7t5AoFnpkKC82630hh1OlfAct4gR2BOIFVH0kSYzwNgabdB5y6BNxlo0ZU3FHlIzy
         gBg8+8lRCC/pnwWol33argQ4/b/lpZXK5sAphcEUSfEeLoH9x1++p2dZ/K1/oSpiiRvB
         Dr3A==
X-Gm-Message-State: AOJu0YxoOWxpY0/FWVZyG+/oaQDene9d8c5vkx1Bju4Bye0qPJaOpxkM
	fhcheDz6qJNFVrhDmSoCmyI=
X-Google-Smtp-Source: AGHT+IFNTrp0LllA/7YkJ8morIKFGIvz86ztT5BNjS92sj48mhb3ZjgnpTVnuat3lT8rvjyvzAuCDQ==
X-Received: by 2002:a05:6808:192a:b0:3a8:6a4b:9e34 with SMTP id bf42-20020a056808192a00b003a86a4b9e34mr25886326oib.47.1694069544085;
        Wed, 06 Sep 2023 23:52:24 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ace0800b0026b55e28035sm800439pju.52.2023.09.06.23.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 23:52:23 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Thu,  7 Sep 2023 14:45:13 +0800
Message-Id: <20230907064514.1764010-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907064514.1764010-1-peteryin.openbmc@gmail.com>
References: <20230907064514.1764010-1-peteryin.openbmc@gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Minerva.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 68f717670f78..32582ee56264 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-bmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1


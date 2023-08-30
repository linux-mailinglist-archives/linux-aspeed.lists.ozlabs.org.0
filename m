Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83378D47B
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 11:06:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kMyV+u7Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbJLL5VLSz3byH
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 19:06:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kMyV+u7Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbJLB73f3z3bd6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 19:05:54 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bd3317144fso4237543a34.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693386352; x=1693991152; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ+Y7CXqKbGK1IYq1UEYCIh7uYK50Z8X6EK6Ai4bZgE=;
        b=kMyV+u7ZUU0wIme5WLJstN2AS1535JPerQ8hYMts8jvt1xFI2fdV4UVFkicYy5y73N
         3lBU8tW3tPUYgayjMMp6n9NnmJbSPxvxGKqnCZ2QzzXo5/WxGYFN/ktjtsdGmoAUMOqS
         j8nBHNAVqO0YeI5ykTSPDASqiiL8UwBGli7uEldYE1rUOZxFQIpUo4KH3pmHh08Nmwwy
         y2mnOMEs6sCx1Yah8lD2nx4/9TRSTIO9sYlR8Tw30QF4wmFhas8e8bQtBKjxWP5e2oii
         Ok2zxowwLdpeZuS6FqmYMIHiV114+5El3oVntFAMyftGSnwjU6hGgZB7Cp8yB50LEmkO
         1baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693386352; x=1693991152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ+Y7CXqKbGK1IYq1UEYCIh7uYK50Z8X6EK6Ai4bZgE=;
        b=k3E7qt4mIh8wAqogNcDLtBHP+wvcDOnPQZkcKBvkvW3Mu2tX61uaTLSZVMVy6jsgqA
         d88o3WPmf5K+EZclHedR7V6SzPQJazdWyhJay+QU9JRzQT9fteCxIYmU6xMB/IvA1aI8
         SdyeWbVUc5obEJ+PXTE6681HvGOlZzuoyVmv7jLwAbW7ndCeOx3ztYBCCWiZC7EmbUIk
         6SmHOf4ZR3UXdAPjqw+pczHe5t2iDTtmKTA8AXA8hr0I8OhP6wn0p8kEtTYur+Ur5SZV
         I8gbhWJJkwzhF3CsCLJNiMU6fYV3NHuNLOlXESplCgBJ7D5RyA2Pz1LEPRL12OubysLs
         O9qA==
X-Gm-Message-State: AOJu0YzIAm5+gzwdbfdM9hD85zEz5SWs1Uc8pCiJQ46/4CXLnw3uZQxu
	W9ZGgx9qmTpgzt4VSSwC1iI=
X-Google-Smtp-Source: AGHT+IHBi4wWX18II858/6D5KjNsEuV47hc5ZmyFbvALqMzO+3lIqlPuTfCfgYY/EmoJoJ1gBDaM8g==
X-Received: by 2002:a05:6358:9318:b0:135:57d0:d171 with SMTP id x24-20020a056358931800b0013557d0d171mr1313065rwa.15.1693386351915;
        Wed, 30 Aug 2023 02:05:51 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x4-20020a656aa4000000b00553dcfc2179sm9263226pgu.52.2023.08.30.02.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:05:51 -0700 (PDT)
From: peteryin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Wed, 30 Aug 2023 17:02:11 +0800
Message-Id: <20230830090212.3880559-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com, peteryin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Minerva.

Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 6b0a6683ccae..b681bbf960d1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,6 +80,7 @@ properties:
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
               - facebook,yosemite4-bmc
+              - facebook,minerva-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
-- 
2.25.1


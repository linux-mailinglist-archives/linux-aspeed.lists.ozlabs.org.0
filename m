Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4073D687725
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:19:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6sC216X6z3cdv
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:19:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=0kR63NHO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=0kR63NHO;
	dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6sBs2L91z3cdv
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:19:17 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id d3so1080428plr.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYQEim1aMd1zzuJMmA4e6AobcW8EG99vfBVaZv6UaOI=;
        b=0kR63NHO0bLqMO7x5f84eHCV8ztqxsEFVaUb1CzThkMCQ5grIfQEcq2AZusm6xl7qW
         mUsf6YIHGE80/pLWp5Gz0wJTFYJ6C1vxx6D7/Xxv4wkcFNEc6CHVBY8QG4BlapBQzcU3
         xiBc8x1aOVWxjWijQ+tJPfJzxc9PIhV2uI0g5smrtn4SnN/otn9p/zgd7beiEPoVdLT/
         XmD3PceJcPJGjT5NCRdRsv7O4bjFpTyBWjpK4RDdL6oQoETWOREQE4hYA1Tye4J6zLqD
         3JbYQxQJUxf89NPyjE/h5qhsmvjchNg9KznJhcNBVjM27uKd9j3+4/NkQ/hH6GQjjwwQ
         Cmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYQEim1aMd1zzuJMmA4e6AobcW8EG99vfBVaZv6UaOI=;
        b=AyVYzUMqrUDUVuRzn/IUqrkqMA8wJoW9+o9uAu1LccnO4atNOisWG/rQ+dACV4Ez+t
         +mVKC/BxTDffKDfJA93xq74LIhIe9qJrwznLBTqIv3RgwWj1RDjbURvcks2K5CBwjJZe
         QJhsBSeL1tD0hjAej5JU8iXkx6WgeU8jCVz0XzYXKzkdWrx9LoCqcsBuLa9cZiGRqURf
         CBY0vNtrNFt5xt2vKQMc7C1mpGKENon4ZVAGs2Pb8DbQTGiMBB+3DOtLREvZKvwMvzJe
         sBlKscjBnRWoPugcTYUox6JwSxoFzcvMbrn8Tl2K3kz6vBgUKC5vDWTf87kfIeZviu0o
         FJUg==
X-Gm-Message-State: AO0yUKVriCC18cc/03fcWZGXuRoldQhExo9auzhfR1yXJvZJ0u6oMYrj
	RKMa6fDJsFQHRdnfc9vPrI2bPQ==
X-Google-Smtp-Source: AK7set/ZVmhVHWKUZUM7FcTZVNEEzrtV4rjOjDXDVGcvHPkD8SzdYteHtyGI+iHyr8Zovw42x1EQ/w==
X-Received: by 2002:a17:902:c3c5:b0:196:433e:2384 with SMTP id j5-20020a170902c3c500b00196433e2384mr5472705plj.57.1675325955317;
        Thu, 02 Feb 2023 00:19:15 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709029b8900b0019324fbec59sm13187552plp.41.2023.02.02.00.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 00:19:14 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for Ufi Space
Date: Thu,  2 Feb 2023 16:18:41 +0800
Message-Id: <20230202081843.2358-2-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202081843.2358-1-jordan.chang@ufispace.com>
References: <20230202081843.2358-1-jordan.chang@ufispace.com>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a vendor prefix for Ufi Space (https://www.ufispace.com).

Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..ab0dd1cb5ede 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1344,6 +1344,8 @@ patternProperties:
     description: Ubiquiti Networks
   "^udoo,.*":
     description: Udoo
+  "^ufispace,.*":
+    description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
   "^uniwest,.*":
-- 
2.39.0


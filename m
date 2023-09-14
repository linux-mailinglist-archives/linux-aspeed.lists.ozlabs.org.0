Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DB7A4139
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:31:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mCXXKZZV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0v5W9Yz3cR9
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:31:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mCXXKZZV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmcp95vxDz30gH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 22:58:57 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so7466965ad.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694696335; x=1695301135; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54AxaIyODcmWfyJ8BtWPJ8cdzZB3lh3tOwv90coDpxQ=;
        b=mCXXKZZVUHQ1I1jFnJfAJ94f2HLS36J8znDgvyOx+a9eOjl0+QefFB6Ihs/Ckyj8fa
         voEt7gvQWkE0Y3OnVlVTuwsDn5RGkAgf59bAQX67MZ0lJwGi/Yeiu415QORJgW7/ByrG
         FQxgZq6au3FbFcP7spNwaFZvBaINjUzfpp3kG8ysHXnUixVf8DqR4qIKQi5ctTCJKqAN
         6GBcCyVTflthQKG1cLZjZslnZa6dCSEIp1mzQbyCyR4g5pKKhG5bXKzabJXUI0eXWnVb
         yw0M4/rB9KGofSun5kGKw9d07Yuf4GLVA+cElGE31D/bG5bPWRrldOrICvl6lA5gtpI3
         zekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694696335; x=1695301135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54AxaIyODcmWfyJ8BtWPJ8cdzZB3lh3tOwv90coDpxQ=;
        b=mkB+toXBFiQVYRe/UJgXCLXWoEA4nujJVe16hAfIMQ8nuXOZx4okuYYMgcQGKSVgFw
         TDA/3VPwg+TBjnPqtwoi4ylCimeZhcx6XQc4s0Un4nXhjPTtsk5TYmJRzX3v60i8X3kh
         y+0seDutUnxF66euEGWCxBYe1LVhPrFrp7uTiM36+P4pN73R4D4F+kq0fN4UIAOcuxeQ
         IOuN4Fqwln2WqCaPN0TEh3GtW2CjPjvt9EUQceyhObO0goo54yE/uLOH5pc2khFjfUII
         VWkp0irbV49dmbHDTFADRb/Pslst7LxO8mucyN6RJVqXKYU8ycK7l+aoqnGNinNXk5/K
         kUDQ==
X-Gm-Message-State: AOJu0YwieAHxXlJDxO7gANjOKLekpA6+NslGLsGvXmvsMt8aMXGuQQkX
	Wj2JAbGbTWm7tWrAuUEEsqI=
X-Google-Smtp-Source: AGHT+IFah//muDrvYy1m+XUIOqGzm7lgQsEg90yqAqp+DU5qq/aboBQTSLPpCR9ilHKqK7TkkrpLBw==
X-Received: by 2002:a17:902:dacb:b0:1c0:b8fd:9c7 with SMTP id q11-20020a170902dacb00b001c0b8fd09c7mr7201092plx.43.1694696334927;
        Thu, 14 Sep 2023 05:58:54 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id c11-20020a170903234b00b001b8a3e2c241sm1535105plh.14.2023.09.14.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 05:58:54 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: document board compatibles
Date: Thu, 14 Sep 2023 20:56:47 +0800
Message-Id: <20230914125648.3966519-2-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914125648.3966519-1-yangchen.openbmc@gmail.com>
References: <20230914125648.3966519-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: patrick@stwcx.xyz, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, Eddie.Chen@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on the Facebook Minerva Chassis
Management Controller (CMC).

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 68f717670f78..749ee54a3ff8 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-cmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.34.1


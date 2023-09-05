Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C91792085
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 08:24:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=M2QX0HF8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfwTf0W2vz3bts
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 16:24:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=M2QX0HF8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfwTY53JQz3bvB
	for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Sep 2023 16:24:49 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bf6ea270b2so9260015ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Sep 2023 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693895087; x=1694499887; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxsrMn8x6tATGpvznfjqzPrwJumviFEl/w5yRwpiI7s=;
        b=M2QX0HF8CC7INHYEvXWnNmXiXLiDqhe8GvyWiCHkf/F/SMWOIixeUEytGDPJ4Hg6eq
         zp/HbyB3pCmLb3hSiQZ/QahrMZl5M8mou6MZQR+0PSaMVSHdyfJlrEkF3mtI+QyI4mmQ
         oIROnoG4o1X4Kqsme1pq2MAPsadSg3fkfT2IkUqnN+rXBUbjOcxSfGFnpWTIwKWkwWyt
         eZIRNdSkMRqo37tb2cAIzhM0SDikW1fsg53fmkA6+ligMt1F8VkxGLpGOjH3XoBSDWug
         WLcU1UB/6/1jkUezrRj+Lee5Timo5sXd6a/Fb41Bt5M4mtzyDt8Ek00ENqhs90FiBC3g
         qSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693895087; x=1694499887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxsrMn8x6tATGpvznfjqzPrwJumviFEl/w5yRwpiI7s=;
        b=CrAd44oEyks4IlIXItJadvOxSmlbx9tadUAL/MTYkehHvgNZzQsSuF9oztVuunTUYo
         0Y7NzmRhRfMiNduOQzMpBDF/rMFq7hXtyjcrHo8ahb/VeGJ3wOpDFTgTiC46wb/ZNRmA
         R2DTEbTmiyEBeEoe1foBibxUdxPlZadLjBmuQJrAsbKZmW1EN8wMVLniloYeu8yvRTxI
         7oJMpjgNkJTPYukuLC8ge591qHGr90cvkyPuJV1xPOYkGhlmHzUUOJophVg3teUqKGx6
         EiNtBKgUXzJTJBWJA+XC56aPcxGxptMd6LGQLuu+IW5AlSObWpKtXKoDsOskWmePeRyY
         VzXQ==
X-Gm-Message-State: AOJu0YymDou1zjdMEuGFEGiPrLcHH6QBYpCv6SYRDCoIhfdnPQLtUp5Q
	Wui48fAtTQCP/KkbOBQIi24=
X-Google-Smtp-Source: AGHT+IEmYFc4UXj9sGYfzDZOUMWP0jG5d5GRi/cJBVbr6OKF0F7K6iBbRd7s5GJlOBV4JH85PJYWbw==
X-Received: by 2002:a17:903:3256:b0:1c0:ee68:fc84 with SMTP id ji22-20020a170903325600b001c0ee68fc84mr9132351plb.26.1693895086970;
        Mon, 04 Sep 2023 23:24:46 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e18-20020a17090301d200b001bd41b70b60sm8526721plh.45.2023.09.04.23.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 23:24:46 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Tue,  5 Sep 2023 14:22:22 +0800
Message-Id: <20230905062223.774871-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230905062223.774871-1-peteryin.openbmc@gmail.com>
References: <20230905062223.774871-1-peteryin.openbmc@gmail.com>
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


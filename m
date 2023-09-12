Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5523E7A412F
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:30:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Hz9ASk3U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw081lYBz3c86
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:30:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Hz9ASk3U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlQQQ3R4zz3cFt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 00:07:42 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1c336f5b1ffso47532565ad.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Sep 2023 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694527659; x=1695132459; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4rRBJhCHj2aVj7Yvl5LQyb1ciYT6RtfI0V079W7e6g=;
        b=Hz9ASk3UXKiDYxKYOj7ynu6RAf6Jr+yNiRY3e2aeZ/+hXJPcLNnYfJJYFfxbTlksM6
         R6qroSIJx3Dwy6lq9TAHhke1X+V8PdIGI1WCyjeVIyAWP+jgAZ4lnyQFh2lXCafsGqfC
         j1ZeYcLCe88/9c1VWfmy7mU4gmwoEd9ypiz5m/6jFjo4pkJrTFkrJKdzael7NXvOug98
         hg2VDHUe/hd7Pu4KKGvLR9aZwhAps9PKco+GL95yrLIRrTjxUNI/8nVMzLvMM6IxCgFZ
         pr/N2be03ncufIMwYLPfU98LsgiMbHv88LqFKnvefWi6iXPlf9MmDe1xYBos/d6D3RK3
         p4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694527659; x=1695132459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4rRBJhCHj2aVj7Yvl5LQyb1ciYT6RtfI0V079W7e6g=;
        b=VjfvzJmZDf7q9Z6QFkr2pvk7YZw9zot4qnEPAZTyjX01jBqvjDxg8tvlqz4nPNs3Iz
         9KwboadoyblbI9j4FWHKwOyrgWGqOkt1rOjvAXpaLDh6kyqI9bMRGnh5zCuLdZgUWzUK
         S+TGU+xV2qLH5z3AUddmkFTN0BIWQYYZhgAgtmU2j8fq1UqeA9d+doontqD4AnIJxlMc
         sW9u1E6ff7fQoxvQDvK2RZLlW4EO1B/i0vLvgHWIFPxZG9/2J5ZpmZrhyWPjUSDqjmaB
         7QrG3LKavVrFIo8/RYJOFVfVMss1qDZrwwIltmn27CC2gDU+B+QGiG7HCFIVI3KAP2um
         raRA==
X-Gm-Message-State: AOJu0YxiXA+2mhU2yZzilK33EowbwTtf5xHCJVzVTfWZ1h0+GQnpHHAJ
	5CgFT193o/+CcFZPBXDj13c=
X-Google-Smtp-Source: AGHT+IFWTBYbUY5zopbPyW+WFsVD6ZVUxCAYNogYZ9qUdRB2H7c8kbzzmj/lSMSXn8XUW+yZ4zMKkw==
X-Received: by 2002:a17:903:32d0:b0:1c3:3461:75b5 with SMTP id i16-20020a17090332d000b001c3346175b5mr16649939plr.0.1694527659305;
        Tue, 12 Sep 2023 07:07:39 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id jb11-20020a170903258b00b001ae0a4b1d3fsm6357762plb.153.2023.09.12.07.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:07:38 -0700 (PDT)
From: yangchen.openbmc@gmail.com
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: document board compatibles
Date: Tue, 12 Sep 2023 22:05:31 +0800
Message-Id: <20230912140532.3797736-2-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
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

From: Yang Chen <yangchen.openbmc@gmail.com>

Document the new compatibles used on the Facebook Minerva Chassis
Management Controller (CMC).

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
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


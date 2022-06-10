Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417BE545BDD
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 07:50:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK96V1TPxz3bpY
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 15:50:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NFhMzn0s;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NFhMzn0s;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK96G4xwWz3bmQ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jun 2022 15:50:14 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id h1so21954119plf.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jun 2022 22:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vxvhQQF+LpnzG0OPsmcVTfh7ByjAVce/l+wkGfbGArM=;
        b=NFhMzn0s/mJDv488GyWPSpoax0GndAHUQ1lTrr53AfkaSRRVfSB19b1pQe9qZcGlph
         HISGTAlCzuB5ypUwqn9PXtK6bTIjTkIjj8i6gajhvoEsZ20bIoe4EqHQTAhXB4Xva4x5
         Y0To4bWkuYWyDB4wg2Bm9x8IaltNwBIO4C54IP6rRFCFvnQ7sCHNm3d51rLmcv29GGK6
         /kORDTpu2OX/aG9DhftPTvXJwRVPffZrotk+qKkUJA83yqx5Qtabw+inyY914l0UbhCU
         L2fLXbOQqlWrlaTfnNOGSQFqf1VyiN2UKVOxJsTYw3i31eV2ZLf5OxWzLaYNboxtsIZV
         ILUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vxvhQQF+LpnzG0OPsmcVTfh7ByjAVce/l+wkGfbGArM=;
        b=xCFrMNPteY2LQclZx538XC1PldNXLDZPhvH82nytwXLhtgcCc5FIOQ7R1z67Abbpp/
         MGY7q87qy8hnLHYowkZyijUvFkj7ZSNW2aUeR9PnM7fzLBK1l4Vrl/yykB0s7Fx2HzoQ
         Ah/aMBVsDQH4+r0QZvv9jGrjgYefJFduyjGR8LrFK05youy4/EkWVuRwZhl0wlu1aL8f
         ZTvN7PQ8o93heWSwr9/38QS8mmhfz7u/FB9yh61e+srqeYJvAgebq9ymV7AE/0HkWsCr
         mDwXjdvQkYjDLGAGANVsi2XKXEoJb4pBJhSRxG1Cd6N0XNUNKJTwPiPuULEna3RGXTbM
         4FdA==
X-Gm-Message-State: AOAM533S4tzNRLE70g6vIzm4JfGgEzbA40W3vpvIIJGM2Iz73rwdCuxP
	HhJK9m0iB3bLlzDt8TNDKC4=
X-Google-Smtp-Source: ABdhPJzBLjFomAJHOI1wYcMswzoSAaZrTfsNtpQw5h6hCKVRFVtrsXsNryoAb7uiNieoVMJhTXserw==
X-Received: by 2002:a17:903:2452:b0:166:4b6c:affb with SMTP id l18-20020a170903245200b001664b6caffbmr38070654pls.68.1654840212476;
        Thu, 09 Jun 2022 22:50:12 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id f11-20020aa7968b000000b0051b90ac6c15sm18553977pfk.125.2022.06.09.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:50:12 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v4 2/2] dt-bindings: aspeed-i2c: add properties for setting i2c clock duty cycle
Date: Fri, 10 Jun 2022 13:47:22 +0800
Message-Id: <20220610054722.32229-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220610054722.32229-1-potin.lai.pt@gmail.com>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Introduce a new property for setting a minimum duty cycle for clock high.

* i2c-clk-high-min-percent: a minimum percentage of clock high

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..4ea6a112f299 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -49,6 +49,13 @@ properties:
     description:
       states that there is another master active on this bus
 
+  i2c-clk-high-min-percent:
+    minimum: 1
+    maximum: 100
+    default: 50
+    description:
+      a minimum percentage of clock high
+
 required:
   - reg
   - compatible
-- 
2.17.1


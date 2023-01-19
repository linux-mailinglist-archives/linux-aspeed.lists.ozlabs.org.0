Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83367746A
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bGc4Wn3z3bVD
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Lew2hLC5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Lew2hLC5;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyJZC1QlSz3fCn
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 21:21:22 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 36so1114444pgp.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=alvox7oxfs/Dz7IeYeOMp2DW95Yg30i+3OxcsGjnsts=;
        b=Lew2hLC5rAjWlTDceaQ8Z0YjpKn70BiBqXx+39OplEwgAxrtff+ArmI96+LX5jRBGn
         cDZAGdjz1ioaeqQ6Zqh1eQ64/+m9gl8NK88Xleh1WFqMhUMrtcHjKN40nQVdV4j8Qm+2
         AaNN+aGqqZqXAolyDbq5Qm9eiBC4dHnNJqb3iQclUgk+Zpn0JGlvZ8yEY0rJZiVttPez
         +qva9/4XUiKYRWRi8YQTIPx8Kee43uhFb5O/a1LaBIIZup8zXNBw3J1pX9pknxPyewQ2
         oba7CHyTqGkSi9P/eDBlGiE8/M1piUzqCawxz8uFU22E419KeQsuTFKjsR1S86qqlVk+
         qb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alvox7oxfs/Dz7IeYeOMp2DW95Yg30i+3OxcsGjnsts=;
        b=V7s7Hr8SOI1rhFbHR+fT/487213LJz9B4sFrJYLRGtIkmIZTRK8D99AEdDf2phjPmR
         kbuz+dEKGVJYB9sTCVegJfbJu3cvrade5NJ156bxV45dRr2pyhqfJqyipCCouSz3uTZI
         EJGyyv7R8eeVIKMFDs1/iy73etJ0l54Ge8GpD8fR9wSn+mGpGgV4V2RYE+IBAI81QHTc
         zPNkuJmq3HBD8RcYro7loDDiTvWqHqw0NGSDN982teEftWK/ieZwdIO5xLXEcHes11od
         vbQNbWNC96UfzrcVjGzQPlsMo2xXKtcRDhFR1JEbaWbDiJ3cNB3InPlD5QLJXOg2iWzy
         CX9A==
X-Gm-Message-State: AFqh2kqoog1dpLrmuZB6uRwsQhyS8zzNO7mMdVEky/CFISVvjytNTXHl
	a8mANl48UnjwmT6GIy2ZArS1wTNxr3xuNh7BlRPuPk/oxGSxuQhSaBoS/U1g5ud/B8HCfPVZ0F8
	AaSsuHhQ0bjwDfaIYdgI=
X-Google-Smtp-Source: AMrXdXt1ImXcPaKYIdueoj4iH9mAMmluwaoNwNRy3gfTgU4Bqmc3+X9CwSe7KcmSJFrllefWY0Hoyg==
X-Received: by 2002:a62:148d:0:b0:58b:ca43:9c05 with SMTP id 135-20020a62148d000000b0058bca439c05mr10211079pfu.16.1674123680834;
        Thu, 19 Jan 2023 02:21:20 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id p128-20020a625b86000000b00580d25a2bb2sm19152964pfb.108.2023.01.19.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 02:21:20 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: aspeed: document Ufispace NCPLite BMC
Date: Thu, 19 Jan 2023 18:21:01 +0800
Message-Id: <20230119102102.73414-3-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119102102.73414-1-jordan.chang@ufispace.com>
References: <20230119102102.73414-1-jordan.chang@ufispace.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Mon, 23 Jan 2023 14:29:55 +1100
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

Document Ufispace NCPLite board compatible.

Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 272626937ecd..0f180aad3a09 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -85,6 +85,7 @@ properties:
               - jabil,rbp-bmc
               - nuvia,dc-scm-bmc
               - quanta,s6q-bmc
+              - ufispace,ncplite-bmc
           - const: aspeed,ast2600
 
 additionalProperties: true
-- 
2.39.0


-- 
******************************
This e-mail is confidential. If you are not 
the intended recipient, you must not disclose, distribute or use the 
information in it as this could be a breach of confidentiality.If you have 
received this message in error, please advise us immediately by return 
e-mail and delete the document. The address from which this message has 
been sent is strictly for business mail only and the company reserves the 
right to monitor the contents of communications and take action where and 
when it is deemed necessary.
Thank you for your co-operation.

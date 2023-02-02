Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D744F687727
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6sC65THZz3f3d
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:19:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dNwpUXIi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dNwpUXIi;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6sBw4tkVz3f3d
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:19:20 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so4822097pjp.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0eQ8wM8+rAZjPTLSsCnuo+7UfI1u5sRbrCqEezFtYk=;
        b=dNwpUXIi12PQHpKG5fST8G0QU3jiIL5bzgKDoZJfGPAOXJuu3E+kAB1GW2maKz0Gbt
         NoSOK9oGmKYYlxjcf4ABKUHpznxB+2JQl8TprBxEBOTe/Aakhnys7+v3z81StLLgn1gC
         Nq++vzoeC4oJClfZVJp8L22mCtUA0wF5OXPU84ccubL7LIV0fLtggRTcRkvX7GuvNQtW
         vDVSpbOWlX/TGJq05KvGBC+Xvh+Gn8HNoToTQLmJ+eGB8xGFhF5pECB+FpSRPXJDcC5d
         3L1GpklJXv3q3GQG5mXlj8EyoFoSVxUDBn++Z7sRtE6SNfU8z34gDbEP3Z4FptgRys/M
         cLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0eQ8wM8+rAZjPTLSsCnuo+7UfI1u5sRbrCqEezFtYk=;
        b=uFdFQeGht4vWwGB+jftdm8FAE22S126qtaDMJs/xsI0v7aTHIUERj+hI6t8YkKL+Qv
         jVpP65yvVlE8AzF5Zlq0qYZc3OCQv+4SjMAXmPjdENE0xJ2t4XdgnaPNWgPtb2fqNFWr
         4S4NxWydJ7CKTwLRYZzUSq3tAQlKwinrTYRw/9/Tu3pUknXtDjKdE5A2RGBd/KoEl4n4
         x37sFbRmbIVeBWVdXgvv7q895LoNAkzCIsRFMh7Ondz7MR4n3iKbpdvteWDTrQQvDDKh
         sEjvkvzgVKPJ6JnOBNi1pWuLNUYYyGjmDumRNrrODgcIVqjJaYO1mlqhwNTo1ZmD8Foh
         vk7w==
X-Gm-Message-State: AO0yUKUXO2t4mqFX692dR3RIOKPJREZBggQ7NJzcSewdD5G3lcNkjYQf
	6DNUDWh6z4Q5jBQmjJAz+W9LGg==
X-Google-Smtp-Source: AK7set8nXuWqsdd7n7JrP2KsPRsnFhVxDvWtJLiWeNlR2xALUpfnOMFhA/1IZ/WRfBq1eOyy0F6+sg==
X-Received: by 2002:a17:902:c412:b0:196:82a0:4187 with SMTP id k18-20020a170902c41200b0019682a04187mr7120337plk.36.1675325958392;
        Thu, 02 Feb 2023 00:19:18 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709029b8900b0019324fbec59sm13187552plp.41.2023.02.02.00.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 00:19:18 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: aspeed: document Ufispace NCPLite BMC
Date: Thu,  2 Feb 2023 16:18:42 +0800
Message-Id: <20230202081843.2358-3-jordan.chang@ufispace.com>
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


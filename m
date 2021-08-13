Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C46863EAFF4
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Aug 2021 08:19:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmD0m4xfPz3bXj
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Aug 2021 16:19:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uZvcZZqI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uZvcZZqI; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmD0g293Jz30DC;
 Fri, 13 Aug 2021 16:19:13 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id oa17so13874390pjb.1;
 Thu, 12 Aug 2021 23:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4kXF8rjOaeUla0M3rXpxWrQcPuqS5qE0SGdfEVWI3rM=;
 b=uZvcZZqIFNj0oDqsoh2+Z3ZzkR7lRij4WGZUrHX0lYsxzbb4EBVP8bKG0BiC8ygjq1
 Adp+InWlnHZS6RdBUnehs469ZSr5pudW7hxw7lamtm0TUcs3OrFTVy3fsAzYNd9FXKQ/
 M56bfvRMRULEu9HhXdtfaY4E/ajsWLcwRlBRcclajQB3iOkCo2aMT+p08YeSwpUkBSYx
 VYA6on8qRoL+ovuErmO+p0+jBxp0Sh4Gqsqec7DOhp9XOMB/dIDOx543fib9cjADRvmm
 33re47tEnRLsqYEqaWbD8iWsqzAR+b+IBRbZwJSss3u5VFzSC/3l9WXWFhm47OWE8vmE
 7veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4kXF8rjOaeUla0M3rXpxWrQcPuqS5qE0SGdfEVWI3rM=;
 b=MIlvsKDzra0EEwFFyPByR2AHX3sM5S2CO30+lPlQSehMQvM0mDXDznARYqzO7zzv92
 ++aICcX2O32mCwBiuM+7JBGPagJBRZE33UzsLJpLnNPxZIJbycwyLY1iblhkJ6YdWFta
 lFGuPx5005L+MIxC0Yn8udWZjmoHgY8OVzTWBGJ1MHRhMsiLFlgEJQFvwCRxCnw/C9P7
 vMdbrJELxd/S87MzgOuupYAJBmPLZwb7/wRQeEsrrSzuEw8UmF9xTJKPL6AfZIgRBGH2
 v/vCZBko+QCoS2XyChtedtOe4AybHs97NNC12RxLjX8/sY/Xi59ZcvTloQHzTRKAhdxt
 02xg==
X-Gm-Message-State: AOAM532BNFBAxCuyMyrHwALL3YdmyB1Bmc5Jc7M+DVv3qsp1zHwRaYTI
 ECojGQGs9+oWhe+6VJpDq2A=
X-Google-Smtp-Source: ABdhPJxH82ZJV9xD4x1exd/C7JijJWwsA0z4BAdmdDdiEerjGXqcQmOLUV7Y6pZUmASz/wyXv71Q9g==
X-Received: by 2002:aa7:870e:0:b029:3c2:f326:468b with SMTP id
 b14-20020aa7870e0000b02903c2f326468bmr999709pfo.53.1628835549694; 
 Thu, 12 Aug 2021 23:19:09 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-92-48-112.hsd1.ca.comcast.net. [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id f9sm733196pjq.36.2021.08.12.23.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 23:19:09 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] ARM: dts: aspeed: cloudripper: Add comments for "mdio1"
Date: Thu, 12 Aug 2021 23:19:00 -0700
Message-Id: <20210813061900.24539-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Add some comments to explain the purpose of "mdio1" controller: it's
connected to the MDC/MDIO interface of the on-board management switch.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
index 01ec3ce0a29d..9c6271a17ae8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
@@ -96,6 +96,11 @@
 	status = "okay";
 };
 
+/*
+ * "mdio1" is connected to the MDC/MDIO interface of the on-board
+ * management switch (whose ports are connected to BMC, Host and front
+ * panel ethernet port).
+ */
 &mdio1 {
 	status = "okay";
 };
-- 
2.17.1


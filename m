Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0B677469
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bGW6Wz8z2xl6
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=tJRmZW25;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=tJRmZW25;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyJZ75DyKz3cfl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 21:21:19 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id c85so1100822pfc.8
        for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 02:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rL2zoNqn7rKJXBUdA7n2h+JOSB03tHyVIMK1O+/+XBA=;
        b=tJRmZW258uFABdbVGNx65PAgSM+mFHemClFfBw7mnvRyxokBeXAz6iIXUsj+pNSsK9
         nibKFk0Hd46wAuOxsHoCP9yZRh4zOlrRjmJB018rhd7zRx264EXSVYJeDkGu78/Bnl8d
         o8VxffqBQOJk7DROKTJ/svVjweCM9oV/18+lIwGyC5invq/IzzfzaUGhUm0AYDWAgXkw
         ldNm4Mq2QhfnYJMq9F/1n43H/epbMpCEO88P5zORZ+alULcUoI+LzQeQqB5eHRaZt5K5
         X08j8+8nIhjHY4gd64/pIxN5ySAmXrPylhfYkeGtxCkXE6vM1zdRbVTKOLn11DcxMgbo
         c7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rL2zoNqn7rKJXBUdA7n2h+JOSB03tHyVIMK1O+/+XBA=;
        b=4JHSu1BRabA762QebLgCUx9Qrtg8ESkUsTwUtkg4RH6TwvZV85alV19fjs95MFtDhJ
         rrFxvKo7Gu/jhwBGhZc6F+ucp4bFM0MTFNKPizCqQ4Yqkk5MSKCExVEOeYLAQerF1Cm/
         Lhc03qJF99607Fwjkm3e9GUzo8m0+N0WaIhZwHPw7Df4enbPB/YafjoJCdwwRucqf3MS
         h7S7SpOAueXo88NSx1bo60zhNr1iWDIJ4kQpvePdIeAUjAdtF2eMW6rB12Ph6odvT/YT
         WloNwlWMHYD/IKF4SwRbVyq12HameTTwqEOcKlQmSUkTaqBEs2U5ZRgS5vgrp8o09rdz
         svEw==
X-Gm-Message-State: AFqh2krbIX9YlLE9Ci5cgo/65Kk2mNJrl3O+AuxL4XoZUNDSq/Z4JwNj
	zbcJBLVWAH+QY0v0ULYNuiTwMB+f7AfxN+sbi6H774eGw7oL9kx6LEjMxMavowmfaos48yDV3if
	VHuZ4uBI+O8uJm04jbqA=
X-Google-Smtp-Source: AMrXdXvoEJVMsJVwWlxtJdUyWwzIN0910blx4t0nBLIMLicnFjHDxkZvxZ6+qurrrAl7cim/GPpeNw==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id y31-20020a056a00181f00b0058bd244b525mr15630841pfa.17.1674123677598;
        Thu, 19 Jan 2023 02:21:17 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id p128-20020a625b86000000b00580d25a2bb2sm19152964pfb.108.2023.01.19.02.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 02:21:17 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add prefix for Ufi Space
Date: Thu, 19 Jan 2023 18:21:00 +0800
Message-Id: <20230119102102.73414-2-jordan.chang@ufispace.com>
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

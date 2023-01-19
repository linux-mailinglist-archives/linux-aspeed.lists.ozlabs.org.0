Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49E677468
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bGR3GHXz3bXP
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Tc+2yp1W;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Tc+2yp1W;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyJZ449Vfz3cfl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 21:21:14 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id 127so1117580pfe.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 02:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YwY5vS3vg7xhsUsIQ1VvphbeU2zwbR546RMoiQfbHEY=;
        b=Tc+2yp1WrmoViXm4dPlfBNSICNv0JpAie0IwZQUXdsjVquejy+neZNgWJx+GqAaxaI
         +6zK+ywgK3dz31I3tecgf0b6Pgt93e0PRQKpyAdGYOUVAa0yn7B0HTT5uY3vOjCZMpsJ
         4IMjOuTM7KZDPDl3E9V18jn5hMnfh8YLJqwraVN9mi8NaEc3EiH4c9S/kGdYgT4q221v
         EWm3mxV0BdqvROaNixmbT2uQnOLXoJYHKJm1e69JhQ0qvwNZrRb46iFRK0mq4r1ZBDzw
         nW2bUiouOaO10T1dTMv31pP2j1zMaY8ATrR4J7vJKoc1t8kofQqWagNuxHya/AbIm0pg
         vAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YwY5vS3vg7xhsUsIQ1VvphbeU2zwbR546RMoiQfbHEY=;
        b=LJ3YVQ5V50qCuS2lMCW2baj6NTa4xDtbTO/1u/GCli6jdhX02luA5WyxEu8xxHfvOa
         9OEeUyoK0/7l+H3CsBxzLmZ0jOudc+yLNC4IPiJZ5f9C9ntxtM6fEUlYyzXRGFMqMSXt
         9HwKhaTn4mNBAKl0Vt9HN88a5uyR9KPPu2Wn+9bmVgddzLjhiHZSJM4ABzLnUbjtUe6D
         qEVckrlOcEsHl+ZK/uPz2tbNR8hTjxPC7ZGg0x/5XqFOFbZfQ6vM1zGaCR07mc9hXZHH
         9isWtPG0lZuM5qK0/906f90mR+BNxe+rOIShVe8d8bNCVum2VrEHeebFdh5UsMjecAND
         tmyQ==
X-Gm-Message-State: AFqh2kqKMV50AChZ7HCEjBuTtrjPalDsoOJPrUEq0T+/DxCzG21FStcC
	YQWtDzOlsqNZjTTO+UFo9koenFSdsWzHxPGZddF07K1vwNst0RFgRpdyqkqFQNe7gM1Su8WCv4k
	hxlG8rub+hqAt2H/uYrY=
X-Google-Smtp-Source: AMrXdXsyIVr3tw3q7AVX+IjP5WhJgBo5ZUYUE2UtmdhLVrNJOfSaH0vYrz7OwqoeSFOtS2ucaxBPuw==
X-Received: by 2002:a05:6a00:1d9c:b0:58d:90d2:8b12 with SMTP id z28-20020a056a001d9c00b0058d90d28b12mr11019916pfw.3.1674123669937;
        Thu, 19 Jan 2023 02:21:09 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id p128-20020a625b86000000b00580d25a2bb2sm19152964pfb.108.2023.01.19.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 02:21:09 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH 0/3] Add Ufispace NCPLite platform device tree
Date: Thu, 19 Jan 2023 18:20:59 +0800
Message-Id: <20230119102102.73414-1-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
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

Add Ufispace NCPLite platform device tree, and add the compatible
string in dt-bindings files.

Jordan Chang (3):
  dt-bindings: vendor-prefixes: Add prefix for Ufi Space
  dt-bindings: arm: aspeed: document Ufispace NCPLite BMC
  ARM: dts: aspeed: Add device tree for Ufispace NCPLite BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 360 ++++++++++++++++++
 4 files changed, 364 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts

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

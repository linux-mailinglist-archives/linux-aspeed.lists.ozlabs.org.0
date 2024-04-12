Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5188A2AC9
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q/kB6czn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9w71cC0z30PD
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q/kB6czn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9w21FM1z2xPZ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:09 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5aa1bf6cb40so402451eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913485; x=1713518285; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wC6YvpE7b4hJoyARtBi91JyrMS4DalKwG74Rgk0uWK4=;
        b=Q/kB6cznWYzFDIKx+6sOaNmZNwJqnVlTt2Ry41ZxQOxsvmqqfkO0Wj4Jp33EBFjh6Z
         JJgzV05cSMBtZpto26blyU7ad6eGQ+N9UlsRkwBF2g1YuTrcKPphYeEmVQokq1W3Rby5
         esoUNDFMpTKHf9vxVTfURzhxtZ1eYyDAXqTKJ4C5ehuXW23iCcT55eruwnfeZjFn5ZNW
         ttG7jy5xv6dxS505w2gEjLOeaq3xxxsnK7VnZuSjOKj0CnaDjO1l6ez3DGom6gvE6qiH
         /kNL2tTy0nTnWKskpJQ3TsFcNmThnoh2hpPGaed/y2SZmHDGD56RqXnZFoSSHgHk+wPm
         7H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913485; x=1713518285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC6YvpE7b4hJoyARtBi91JyrMS4DalKwG74Rgk0uWK4=;
        b=vFJUZhXNkIfOijU07nSSOsH2b7hlCslAlI8ukeQnR1nlaVAhKHxyVUKebCZ8aaiTYi
         d54Et7wCp3ovT1rjlCo2co2+/YCy2MI7veeySRNSigGIPGl6CiWLNRdCjya2hcmmhrai
         f2nPSwDVCdcCHsqh16AjhAoPbdeegWHIklKEerfniG64tJZ0ZRS+LT9SL/dzm/dVwsK4
         Wv3+flV1YNOm0HpquFK/Zh3vaNd5u2ZRvNRMWSuG3dPqAI3CRiRVLBLG9v4V+1VWQOMQ
         KOizp52NCS/wFSJfzD2B2wdOVDpvD9VQLaLfjOdGP65dDIC0XCzeFLoiDy5hOxXeSoeu
         Wtnw==
X-Forwarded-Encrypted: i=1; AJvYcCUeK8CW8uezISOv93SDwjdy01wD6FGy0rmJB1fzSz+qSb+5tdpCgbvJ858ewE8tVIB3kBvYBu70CkJcdzZgXmmyUZIB7bMR78q09SQS6A==
X-Gm-Message-State: AOJu0YyVJ7Jx2Jy71PrhOH2Hw//6t93IPuS47TV9kqrfQJKN2o9PIWSm
	SCjfhTO5eAJuLoYkG/ukEJ9N3JMQWjEFGakepsafzbipnzRmGn7U
X-Google-Smtp-Source: AGHT+IEXH91UuW/BOgWLuecnv/22wdajH927v/Oc9c/RokBJowFcYqTiNEL3bZQLhYB1XNnkLg7S/g==
X-Received: by 2002:a05:6358:420b:b0:186:1128:bca7 with SMTP id t11-20020a056358420b00b001861128bca7mr2526716rwc.6.1712913484932;
        Fri, 12 Apr 2024 02:18:04 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:04 -0700 (PDT)
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
Subject: [PATCH v5 00/12] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Fri, 12 Apr 2024 17:15:48 +0800
Message-Id: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmLvP8Qbepm1AVjuCbaKw@mail.gmail.com/

Change log:

v4 -> v5
  - Patch 0011 - Add retimer device
  - Patch 0012 - Modify gpio line name

v3 -> v4
  - Patch 0010 - Revise node name
  - fixed PDB temperature node name in Patch 0006

v2 -> v3
  - Patch 0007 - Revise max31790 address
  - Patch 0008 - Harma: Add NIC Fru device
  - Patch 0009 - Add ltc4286 device

v1 -> v2
  - Add infineon,slb9670 information for tpm.
  - Patch 0006 - Add PDB temperature.

v1
  - Patch 0001 - Revise SGPIO line name.
  - Patch 0002 - Mapping ttyS2 to UART4.
  - Patch 0003 - Remove Vuart.
  - Patch 0004 - Add cpu power good line name.
  - Patch 0005 - Add spi-gpio.

Peter Yin (12):
  ARM: dts: aspeed: Harma: Revise SGPIO line name.
  ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
  ARM: dts: aspeed: Harma: Remove Vuart
  ARM: dts: aspeed: Harma: Add cpu power good line name
  ARM: dts: aspeed: Harma: Add spi-gpio
  ARM: dts: aspeed: Harma: Add PDB temperature
  ARM: dts: aspeed: Harma: Revise max31790 address
  ARM: dts: aspeed: Harma: Add NIC Fru device
  ARM: dts: aspeed: Harma: Add ltc4286 device
  ARM: dts: aspeed: Harma: Revise node name
  ARM: dts: aspeed: Harma: Add retimer device
  ARM: dts: aspeed: Harma: Modify GPIO line name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 107 ++++++++++++++----
 1 file changed, 85 insertions(+), 22 deletions(-)

-- 
2.25.1


Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EA4CCA65
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 01:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8p3Z1xQwz2yK6
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 11:03:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=epc/hkkP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=epc/hkkP; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8p3Q2258z2xWd
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 11:03:27 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so6491289pjl.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 16:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uhcD4UvaPOzmyw+JIMMImnAjRph755cmDjQJ7NEOGPo=;
 b=epc/hkkPONQlmZ2L6W9lZGK93Yj9NTYnrX9YhoRHv7uSPpZFJOeEeI9TMf6AZgGbAA
 cZa2P3MQ57+v/jQK4M0xtcY8ft/B6paTbrfvKHag90BjZm6vRk3lErU5m6EYgLLvWWHz
 xpN1iSrHPHLvZCj+mpDl3J6BtKsDOfKDHnAe6XeHUdA69lLgz7DuOacfxwMAqL8+DHzT
 ZrKMnodmNP9+HlzcbqAT1PxHtRGGpw+KYjcdf6IO6SJ2AY6a85u3snSNwc+wyb4mY08y
 15ME72/O9ucYQNfFbVngQ57XLjIVvE8DcM/hbNEWc9DPPRkROUrxDhewz7I2/CxEya6r
 0Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uhcD4UvaPOzmyw+JIMMImnAjRph755cmDjQJ7NEOGPo=;
 b=HAnRHNt8VnNrN/Tc3NIE7UD5cGLfz6H136NToc6h/qXoyxNwFzR1RGNYwsPdkzadVf
 u5QuBgp2n3Ulx/l1ci/Gu0Yrzj+MbCcFa7OlOPeIN310MLVBfuFQWcqSBZaGekm2+JGz
 WI64hqUW7AuQMYM29kb7jNZOHENjWUR/IXyDMeHqs6+M+dZSeRTA3kN1HKsO0Ux8TCzt
 y5B+Jrd5iJAXXfiIWGpra1Xf2R+w/mH3q4UyOIRJxYhLJm3ICsQZuKGxCnVbUCKiEK8T
 osEvyBhjjHvCdaKvgx7WFhP/u3KzOTq6YosY1KgDrqqgxGkY9xUw67pEZDmb+ibQiGgh
 EiFw==
X-Gm-Message-State: AOAM530GcDXfJzeDAll8NSaTR4RWajRr3/zrAK4+RhPKmSo5YZoS3aN1
 uYwsxX+86uwRVbzwmK9MYmU=
X-Google-Smtp-Source: ABdhPJxnSRBdeXggNjwOC3GlHeBWS9e08z+WqN7h9hP28KglwVu0Nxdfq7EsiiynMdPOJRjcp+FEGg==
X-Received: by 2002:a17:90b:4d8a:b0:1be:f5f1:89d3 with SMTP id
 oj10-20020a17090b4d8a00b001bef5f189d3mr8012723pjb.79.1646352206557; 
 Thu, 03 Mar 2022 16:03:26 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa79588000000b004e1dc67ead3sm3579070pfj.126.2022.03.03.16.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:03:25 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/2] dt-bindings: Convert GFX bindings to yaml
Date: Fri,  4 Mar 2022 10:33:09 +1030
Message-Id: <20220304000311.970267-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

v1: https://lore.kernel.org/all/20220302051056.678367-1-joel@jms.id.au/

This series cleans up the bindings for the ASPEED GFX unit.

The old text files are deleted for both the description under gpu, and the
placeholder one under mfd.

The mfd one existed because pinctrl for the 2500 depends on the gfx
bindings, and at the time we didn't have any support fo the gfx device,
so Andrew added the mfd ones.

The example in the pinctrl bindings is updated to prevent warnings about
missing properties that pop up when the gfx yaml bindings are added.

Joel Stanley (2):
  dt-bindings: pinctrl: aspeed: Update gfx node in example
  dt-bindings: gpu: Convert aspeed-gfx bindings to yaml

 .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
 .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
 .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 16 +++++
 4 files changed, 85 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt

-- 
2.34.1


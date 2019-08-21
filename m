Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7802971BE
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cxjd4cfnzDr02
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:56:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hoz2qoe3"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CxjX3yMtzDr2q
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:56:00 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bj8so726349plb.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GU/N4Wt9Jhh2lg0lHSh02Sw8UrK6gO1IosLXs9dwpEE=;
 b=hoz2qoe3untu7b0I0pmk4wsv6BKU3ONXOAHIsaHWTD9rlV/P6qVSgSH6ykOljr5Ok2
 5/33JRU9j+tIizRAndWPCv5eJJSg7a0/NjSjtnrreaG/wf5YiePdJdKJJLcc8jDv96Iv
 joWkTQrxYsJEfPr8O8zDzdvO7Pyt7qexU9fkUDvjOrLphRVV6LXVi1FXR0rQCO8YWV5z
 3TEV9k+I6RIcfTj5vfjAvXcM9Ogl6ihYzXvutvBPnDFnOFEdVsbEqJzcX0kCbNqpto48
 nl/EG3gmFE13h4UpL2USBr0aUnM5SvwI7ttsD5YBJOzFfteDkax42w9dgHqipYzdNkW/
 rPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GU/N4Wt9Jhh2lg0lHSh02Sw8UrK6gO1IosLXs9dwpEE=;
 b=J3XlfHF9sMk7RkYu/YMBFXqOflL5GHUFFwrZaHGBW8Ey5IDIavHoTpLJ5iyd+OnICS
 3mBtQG1u1ZIhaC0UlmWMZ5uiaDdrZIIfUd31Fj5bKMJV1KSvwpRreCVqHq3tXnPSJpy+
 yucbOHujHLSFVUZbRHWJU+lQUsgdFyVE3UA1+qtx0iYYSbPByLeuXqFbHbPqpD7EIFHo
 yBO056uNIp9fdDKArUKGyQC6dO1YqamqSv9wLxSge6maC+zLJXv/VjW+0xClYDsjssCj
 H0cbQnNXBtqktfwOTr02DMqcxJ4CVHsbq+SX5ShMR7KiYvmVJTuF8lvlIYZ+lCzMKGZG
 9knA==
X-Gm-Message-State: APjAAAWzEX+J0a8q57Mx7RnqaFWNODcm8WwT7nhYPUxDDLZ1BeKIW8Zy
 0R6OULXUoc1V2T7DZ+ptkDE=
X-Google-Smtp-Source: APXvYqx/+74Ju52rJensxsSB8gavDnVTt9rl9lckMS8tlYydaxstjCH33nxjcMKNuuqbQIFLJXTY0Q==
X-Received: by 2002:a17:902:2ac7:: with SMTP id
 j65mr32562068plb.242.1566366956589; 
 Tue, 20 Aug 2019 22:55:56 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:55:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 1/7] dt-bindings: arm: cpus: Add ASPEED SMP
Date: Wed, 21 Aug 2019 15:25:24 +0930
Message-Id: <20190821055530.8720-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821055530.8720-1-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 SoC contains two CPUs and requires the operating system to
bring the second one out of firmware.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index aa40b074b864..727e0ffc702b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -175,6 +175,7 @@ properties:
               - amlogic,meson8-smp
               - amlogic,meson8b-smp
               - arm,realview-smp
+              - aspeed,ast2600-smp
               - brcm,bcm11351-cpu-method
               - brcm,bcm23550
               - brcm,bcm2836-smp
-- 
2.23.0.rc1


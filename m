Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FAD5E54F2
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 23:10:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXrfJ5zYhz3c1N
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 07:10:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZLrVi3gk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZLrVi3gk;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXrf95b5Wz308w
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 07:10:07 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id s6so11332498lfo.7
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RfoS4oNSl3iLm9QkSJWnFYEHwL243tVfavoKrg1T0Yk=;
        b=ZLrVi3gkesY3f5rBqcgro6CMPhda3lfN+tvhwrlra74SdGidbOb0IITpJNFdVxHbRb
         cr0T/Ak7pmh8hciLZteZ2Vd43eXLDC8YRxUPH/N39duj/2dSq2o4JIh22IaouWxO645z
         tOJjARv599o/6owL6+Aj63mtYNX9znFnl3StMvONNzu/LDdLwIkuQbiEul7ngFFagYuP
         lP9vGPA4YzjDzdv4KFhWEZrq1TUwuPHQLI6rxVMaVhT6AyIcpQvdS457nyZgXb7+3b8g
         rKdV4tgVlTACzKmD+sBTC0z3NyLqCJp4aotEjnfvLZ5kHSXSaJyA7fbrMAkMBmVgJT8/
         zvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RfoS4oNSl3iLm9QkSJWnFYEHwL243tVfavoKrg1T0Yk=;
        b=bOgo5YpdCjr+SDtHP08nlT6uqH+QavenIyeWN5d1QnP2ro4xfhSZ5PiIAoOP3A5qRG
         2Cbu+sgcMOKk3cT6GnoePzuhXnNxeaPNBcIVIOAweECtvW3WOYq6ZKCjTaH3DYLdaS5w
         GaJb1aly38xt1fjvohNt8LMBpm3iCq0w37Ms4oOHSc8SjW9fTcWovFMufLfUFicxxgeM
         r5Fbxj817Gxqq+xx6pL4uPNnfTb120JX8BpCHMvWOSWiiA9zGXScfuS+BjulQVjfO9/P
         HkzVCDPuQqBdE2TSr6QmOHmypOFdEIA5ChaT2KvJ8++je7vylk90FdRwr6ouwgrnDJF/
         6Jrw==
X-Gm-Message-State: ACrzQf0/frTX3fHXX+XcV4O/m4lgNDfJQWtYNvx4mdeh3YGlq/qX7CL8
	pGyGPMcCD6yzTfIty4iwCKQ=
X-Google-Smtp-Source: AMsMyM5Ki08t3TG6Pk2qQd8w4vkm6laOpa8ltLFD+v+d+zb9XxFVHDhHFN5aPkWp8FaP1wpeOj82Pg==
X-Received: by 2002:a19:4315:0:b0:497:7488:7a76 with SMTP id q21-20020a194315000000b0049774887a76mr12056lfa.286.1663794601048;
        Wed, 21 Sep 2022 14:10:01 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-46-242-10-176.ip.moscow.rt.ru. [46.242.10.176])
        by smtp.gmail.com with ESMTPSA id z18-20020a19f712000000b0049adbc24b99sm599260lfe.24.2022.09.21.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:10:00 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH v4 0/2] Add AMD DaytonaX BMC
Date: Thu, 22 Sep 2022 00:09:45 +0300
Message-Id: <20220921210950.10568-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920165404.14099-1-aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Konstantin Aladyshev <aladyshev22@gmail.com>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add initial version of device tree for the BMC in the AMD DaytonaX
platform.

AMD DaytonaX platform is a customer reference board (CRB) with an
Aspeed ast2500 BMC manufactured by AMD.

Konstantin Aladyshev (2):
  dt-bindings: arm: aspeed: document AMD DaytonaX
  ARM: dts: aspeed: Add AMD DaytonaX BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts

-- 
2.25.1


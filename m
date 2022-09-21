Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E455BF757
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 09:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV5q2Mb8z3fpj
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 17:14:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xyx8LqSh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xyx8LqSh;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTnx4Y5gz3fBS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 17:00:36 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id x27so7752306lfu.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 00:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=N77a7ZWZLVSzuEs9PfFRQdKlqEhHQDfD8cUFuVw8P4g=;
        b=Xyx8LqSh3dS1UwjyAGKdGrxG3D5EFtUBqE++LL8PRxyFHtUTeucKdJFSNRUt/JZb3r
         Jl8cGDdEVjo+XRI9j3JGtmQGBBT8S9lHhiytA+XIP4Hp9Qm8884kEKjxgfEjFnpTfV1/
         lIu3VT7EAWLIbJWx2sHvkaXu045Touf9TBmWKzMb/Z6ydAaRTeBFV/+X4kac0UHXB6Xv
         mfpnxcn0xEPiqZJ3ysPiu9UKRMxADYsFk0MmX3IlP4zcqVD1YUDiASrMM3ROCEP1acks
         siFrsnE2va3zAWVJxKFJdYXcZilC39ZsJcXZVeijlaGh11OXkHXOZ70zhum1j0ceNrCX
         CbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=N77a7ZWZLVSzuEs9PfFRQdKlqEhHQDfD8cUFuVw8P4g=;
        b=agZtjpibF6zycOa2wSDbq18q9sRTAuY9v40nVsOn+IcSVMWx2hM8BExzvn3Fsswe0/
         +O7h4D68zKXEkYpSd3+vDP0hSsvbA836ErTYoL1/zoYODSg82pE1SphTlBLH59cbf9TG
         JlDLf/ELI07JyZf+zHaS2zNrbF+oetmtFbBl+GPTOL/watvgVW5WRAjDvC5ic6ZpDpC4
         QbkGexqJfbKg6oX5bKz55YDJHFBTcHQ2BtQuTAVByzfQy/904RfWn/obrQ6BhpWezsqG
         SOF9cf246mP6O77JiNSuA9G5HUI1LIf5jSHat6fgnykclJftJUrcb79brJC+7FktxBrb
         6WDw==
X-Gm-Message-State: ACrzQf3syEoPtVdxjfkYC5qoUOzuTnXTijmn5Q7rJoB5X/jA/QEgsRko
	YGtHW7+cLwpDIUqTM3xHZyU+xQ==
X-Google-Smtp-Source: AMsMyM6YXjbglb47123EEs+0O1+bBUj4UyJq6W40nB5nsY1TNa7SX9g/bDI5Ncskx5QFc2gfNOf8EQ==
X-Received: by 2002:a05:6512:1088:b0:49f:c019:a3ae with SMTP id j8-20020a056512108800b0049fc019a3aemr4120639lfg.332.1663743632337;
        Wed, 21 Sep 2022 00:00:32 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c11-20020a056512074b00b0049aa7a56715sm301294lfs.267.2022.09.21.00.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:00:31 -0700 (PDT)
Date: Wed, 21 Sep 2022 09:00:29 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: Add AMD DaytonaX BMC
Message-ID: <20220921070029.a5beb5ug6jb2jex3@krzk-bin>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920165404.14099-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 20 Sep 2022 19:54:02 +0300, Konstantin Aladyshev wrote:
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
> 
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


/: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dtb

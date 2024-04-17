Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7495791C
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHw5xv6z3g8L
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mhkCVgZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKDMl4xpsz30hY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Apr 2024 18:19:13 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-518a56cdc03so4642845e87.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Apr 2024 01:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713341947; x=1713946747; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WVqvTWkSJuMK42oCBd4QTeLpoVUswiSt5bNCxSQhCk=;
        b=mhkCVgZSlMiXhvFHJoYpzN7xgf9LfDatASpbIObBxbn1QpmNc4qY/4g1JVsmWNS9/3
         DMqLjCIhEvN5hsbCsdg87tw4yzJEwpwG2peK3DAfjte6HOBOq7LSu8brgFpb8ObQFs68
         /lesXauj+9F6PZNAW7BKPhIXhOpfE1Br1ovI11pvN36OJOcdDdBt7XSi2cKNNKkBv277
         ks/m8Xwi09vMR9FQTZ7yNZMLpmox0ETeTs99qEJgMrYA9sTkttra3bDh586W7+w+BWkc
         gX2uif/c3ZJ+FGgWnMpJLw3Y6KZGJPNPmm7WT4pYALUIhBALjKy6Gvq6Ly+YVxr8xrar
         816A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341947; x=1713946747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WVqvTWkSJuMK42oCBd4QTeLpoVUswiSt5bNCxSQhCk=;
        b=vVF8DzuoF5z7iaZR5gGO/vOkqglX+J7yOAIVJ6wuwXscnvsp1dY4HAMUW0a9ZTd0jt
         jWXB5Pz5o9sjwOfontD1nMy2rnmtctXjW1Y2SEsd9amf5mze632LkJuv2QPjO2u7kAbD
         BG/PAvUcFqPGAUDkmipqzurL0pBZZu9rWJWg3dci0N6BRky+1OC69X3zrJ8Hikprr3Mb
         ZeaRn77yHEaP/EDhUs6JKMD8k8Eg8ioZSRWTTHOwlyNE7g84h/kJRbFWaLNnoolH2l2O
         I8yftb0UGBvNJ0ty54hvzCO8YslXwpXfzRrPjsc/sSSviqzSy4AFH0jKZOCd5m59ua/v
         6AgA==
X-Forwarded-Encrypted: i=1; AJvYcCWOlAdHVzqe4CWJ357mUb9Q95QURS7XVrY7PKLMjMoA4b+kvCCzUat7QfyzGVOcMchA+8hn9zrXJolgxCcPM7AxIPu6iCh2kgXBV9WvRg==
X-Gm-Message-State: AOJu0YyiU8WtHmAYmb+XMgh4CExphLWedZGIl5UZtGHLxFvFEDasKsCI
	RRlJtDoTO6IX8Nas6+a91sQROjca6a0dHLgUD0Eii0NdHhF+W1Vy
X-Google-Smtp-Source: AGHT+IEZH+ylq78IQkJNfP5FDxkXscm3aRgH3ubDyx46wNRqQbkl2T+2tyX+4h0ejdbXrQysINo+Vg==
X-Received: by 2002:ac2:5106:0:b0:518:8c8c:db33 with SMTP id q6-20020ac25106000000b005188c8cdb33mr8624693lfb.7.1713341946952;
        Wed, 17 Apr 2024 01:19:06 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id p27-20020ac246db000000b00518948d6910sm1446525lfo.205.2024.04.17.01.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:19:06 -0700 (PDT)
Message-ID: <04f71d99-aad2-4e56-8f92-89469c159b48@gmail.com>
Date: Wed, 17 Apr 2024 10:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: rtc: google,goldfish-rtc: move to
 trivial-rtc
To: kernel test robot <lkp@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240408-rtc_dtschema-v1-2-c447542fc362@gmail.com>
 <202404170656.LoL9eBYs-lkp@intel.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202404170656.LoL9eBYs-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 4/17/24 00:45, kernel test robot wrote:
> Hi Javier,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on fec50db7033ea478773b159e0e2efb135270e3b7]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/dt-bindings-rtc-orion-rtc-move-to-trivial-rtc/20240408-235612
> base:   fec50db7033ea478773b159e0e2efb135270e3b7
> patch link:    https://lore.kernel.org/r/20240408-rtc_dtschema-v1-2-c447542fc362%40gmail.com
> patch subject: [PATCH 2/9] dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
> reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170656.LoL9eBYs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404170656.LoL9eBYs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>    Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
>    Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
>    Using alabaster theme
> 

This issue has already been addressed in v2, which was sent a week ago.

Best regards,
Javier Carrasco

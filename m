Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC279E1E5
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 10:21:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mYuOyhNX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlthX4Cdhz3bTP
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 18:21:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mYuOyhNX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlthN64t4z30NP
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 18:21:24 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4013454fa93so74014675e9.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593281; x=1695198081; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yV/iPlTqbuR7AJsSEy3NRKH56jsiO3itpIr2ZhKOxI=;
        b=mYuOyhNX/QxvUfnTUhIr7lSzACYhDrab6eUD4lZHAhpCfE+0eCXaiV13fKZc59qiSy
         1eJTh+TIFEUXmaZj4uVmFQS5oE+34+5PIJ/VpcZbgy8kCuVdN2SJTCaw0A8RhJbmKqND
         FQkRPb2nGDXe5A5CNsNXlkRkgC1lMOeJu498zwINRgwIOyZOb76iD87A+RlCd/OiqUML
         aXRe3EC1OzNjEL6BaMs5nNR3nhM8JoNrnN2U2cM9zY62SWn9PDT/Cuqka82DneIVNitS
         Dh/rgEIQRbHZYH3teQL5YmvVonshnJU1QVRS9jy0FipUKrDgRMX49ZsNNMYegMHsrMRx
         k+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593281; x=1695198081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yV/iPlTqbuR7AJsSEy3NRKH56jsiO3itpIr2ZhKOxI=;
        b=Oi6nEMvJJYISyN/kVl6ubsr0+eKK8jn6JKf1PpuUcvaPuR0m4m7/jGC8TmqarUgY1y
         Ac2sWSeXlKYbTzw63HlT4umXD25c74mzaGdrl2SU09pu9srEgAyqbBCVRUzVf6jA/BLz
         j4oOfKz90szBPaJkbXd3GCfn0CEFJX3XpCeQ84IcYys+j0aVLqGzGpBi/sUTgUBQqIEo
         OC6FUncLUY3sXfWfhUbyoOT63rD0MtJiDThhd6nhYqXxZK5AgvxnQcWlnT8vCtdRYRTK
         MztGYH23n1CjvkmSMDAeMcrwOI1IIl7IO9QCgD7vEQ0o2OI+tTJLmvJjm37Z8Qp4KiCf
         9M9w==
X-Gm-Message-State: AOJu0YyHbYTAe5/4jBRwy3UULv4IJ190K3ODfB5CV+OtvlAhjBDsWVw5
	UCgq3SWEqjIBr1R/HW83KAgaZg==
X-Google-Smtp-Source: AGHT+IEdMCGleJenSkST6EFbu5Qz4wEAy04mq+fsiN3qwHV8D/PMO8U98ONfNDNkfas/yiQbKOrXSA==
X-Received: by 2002:a1c:4c16:0:b0:3fe:dcd0:2e32 with SMTP id z22-20020a1c4c16000000b003fedcd02e32mr1357415wmf.19.1694593281687;
        Wed, 13 Sep 2023 01:21:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id t22-20020a7bc3d6000000b003fe1fe56202sm1286245wmj.33.2023.09.13.01.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:21:21 -0700 (PDT)
Message-ID: <f3100f6c-926a-7fb8-793a-d930e6b720c5@linaro.org>
Date: Wed, 13 Sep 2023 10:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC
 board
Content-Language: en-US
To: yangchen.openbmc@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-3-yangchen.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912140532.3797736-3-yangchen.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: patrick@stwcx.xyz, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, Eddie.Chen@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12/09/2023 16:05, yangchen.openbmc@gmail.com wrote:
> From: Yang Chen <yangchen.openbmc@gmail.com>
> 
> Add linux device tree entry related to the Minerva Chassis Management
> Controller (CMC) specific devices connected to the Aspeed SoC (AST2600).
> 
> Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>

Also looks like a duplicate.

Best regards,
Krzysztof


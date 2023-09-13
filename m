Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5AE79E481
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 12:04:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfyNjczm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlwz13VTVz3c3M
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 20:04:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfyNjczm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlwyw0pSVz3bPM
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 20:04:05 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9ad810be221so244614266b.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694599437; x=1695204237; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLAQ3xSyHcqOfoBP/xtKa9Z87ZAYx/dOKEVwQ/GtggQ=;
        b=jfyNjczmuBV/DSD80WudT5qZMnPjEMsnd5Ktyv6cjjWV2Mm7fd3xtRkL0TCDDPGYTa
         hmL0EsGvHGkx83ja5Tmi8KWXh2tT5ZTeZ8E5iIMxJFznVCHxYS+eHS26CzRNfD53ZVWY
         M9kPOYd2FWyckVa+TCv08Xl+kZxbVY4tgkHW8I7bH5V7PK7QXjkfaJyk4V2ZwRg7XGD8
         O6g1RdUocWko05owrh6Ft/NzX9eNepUiG0N/EwiZzefwkxy6Disi636hVeQyTUBL7+1P
         38a8WGDxyEZK5jkIS2kU0HjrhwClwpDKVsqlAIb80D3Fki8nqRd4LDxe6LJYxyeN4I/0
         +/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599437; x=1695204237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLAQ3xSyHcqOfoBP/xtKa9Z87ZAYx/dOKEVwQ/GtggQ=;
        b=U6Wb8H7N8RqfxYKbSdstPMZJaQGVastzNQ6Qr/8CMJYwYOsHc2b+MdJhAYqlFYYx0o
         4M8lfjZZsigbEW0hnmksBcaJ5Ji3XY+qlO/7brcXItDuhrC9MB4mmDrxw6bhrH7gcqpj
         Z/SqVEfe8fQ3JOwru6S4N99y9pnvfEbAJJvo0VtJgybMFwfyiDiniqWGJHlJPVOLVBn1
         f5r5HK/fpcNsIQxzhvKm5wuYNFOlmcrwKPs5KDpi5cgxNTp2mHuLXVn3zgsP40usZvxK
         1/pLAGPr97Cz9pdJJANXUrZoqYw73ipto7hIOXE+p0iY20ctPZgDNusWnMYOXIz3cyGU
         pGVg==
X-Gm-Message-State: AOJu0YyvyMDxbz0DGRjpx94bUkUw1RJtadoVwFBDIGtwgR1n29lYNzcE
	JPtbKLa0yWI9T/Go78CKNEJjbw==
X-Google-Smtp-Source: AGHT+IEETXzISBXjowFUDZEJ1z9P9NRNjTk+mxv4B0tWc+QhuxTCzgVqYH9DU8ad3610ghNzGTK9hA==
X-Received: by 2002:a17:907:75f7:b0:99d:fc31:242f with SMTP id jz23-20020a17090775f700b0099dfc31242fmr1512151ejc.66.1694599437069;
        Wed, 13 Sep 2023 03:03:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id sb5-20020a170906edc500b0099bc0daf3d7sm8211156ejb.182.2023.09.13.03.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:03:56 -0700 (PDT)
Message-ID: <3b36edcb-e678-8a4f-2ea1-7a7d7913a9ff@linaro.org>
Date: Wed, 13 Sep 2023 12:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: document board compatibles
Content-Language: en-US
To: yangchen.openbmc@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-2-yangchen.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912140532.3797736-2-yangchen.openbmc@gmail.com>
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
> Document the new compatibles used on the Facebook Minerva Chassis
> Management Controller (CMC).
> 
> Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


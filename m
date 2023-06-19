Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A408734BF8
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jun 2023 08:56:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nz7oMq/2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql0tJ22JJz30XQ
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jun 2023 16:56:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nz7oMq/2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql0t85m9kz30Db
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 16:56:30 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b475b54253so12012231fa.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Jun 2023 23:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687157785; x=1689749785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVQvPmZfMjyE4EriF44N+ZqOy+pXJULp7jhybIMTZRg=;
        b=Nz7oMq/2JerE/qSJ0p1lmM0Tc6F/T4n0tY/5puv07oURkxjNaE3hnag7QPHhBQjjtu
         pVxH+uT/izoeyx1d4ygzWZPMkHcF3kXs3BSobsB0Z/iATiWJ9slFaccqjZs+5nVaRg9l
         xaKTFpVuIW6y12JVg0ZeDuO+vLXn8SIDk8GUMppBI4UXBKFzuGKyX1xVaYDLDQjWsubT
         550gEcY9B6WXteuUHKUJk3DU3p4BUHhK3cLpmq4h93naDBxH8tvUzPG3dSwkmteTcnxE
         pIXu6PX7TznbjL37tyhAa4kt9fasvG4OKhMLYeiqIOMBjWBxam5eGAM8trzdor1oITs/
         yIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687157785; x=1689749785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVQvPmZfMjyE4EriF44N+ZqOy+pXJULp7jhybIMTZRg=;
        b=IYgDcvmwTvn3F9bex5N04tEk0gvLcBFJb1ik9ANnl3/9XagwWhzy3TOkyMWrSghtGr
         C0bdZmRRc6P04ADBEb1l5+iGetbG17tpADaiDoZyWdqjHJJ5LTIuCz9vJMkSUFVTrypz
         X8g49EBQaf9ou2xTcZTTxZKQ5FqKVCNHpNGRQL3tn8RubeWzfx6J3lG8H6kOBAgzEvET
         KiYwVNdFQudAzbwcIrP694ELn4Uydnx+7gXeTPJ68oPVG/ntDMR1MiPrtGUZfhpd79MZ
         XNfcU+Mjp2aKF8VtN/YPgosTw/vNhUbaQi2+mY2dWfbraFL852uD9eG647lnLjeVXg73
         RXYw==
X-Gm-Message-State: AC+VfDyM+ipKP/RwHh5TOxVtrH/EXBD9RRmb0iwfc+RZEBJPTI2UW4UQ
	jBtNhyUzzvxJE0VcfuPbMDSVTg==
X-Google-Smtp-Source: ACHHUZ73QHeatxNWNXWGjtENaICZG2mDwLhCI1onbdo3FjYTjn3nlSLNYVQvlsMOir4Fl3iZo9lkMQ==
X-Received: by 2002:a2e:9a8f:0:b0:2b4:470e:8447 with SMTP id p15-20020a2e9a8f000000b002b4470e8447mr5553201lji.34.1687157785301;
        Sun, 18 Jun 2023 23:56:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o8-20020aa7d3c8000000b0051a575c76e6sm1172846edr.43.2023.06.18.23.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:56:24 -0700 (PDT)
Message-ID: <2a9e503b-7a5b-3b1e-a912-5d54a23c1ca1@linaro.org>
Date: Mon, 19 Jun 2023 08:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Content-Language: en-US
To: PJ Chen <chen.pj@inventec.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
References: <20230619064249.3623-1-chen.pj@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619064249.3623-1-chen.pj@inventec.com>
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
Cc: ye.vic@inventec.com, Huang.Alang@inventec.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 19/06/2023 08:42, PJ Chen wrote:
> From: Chen PJ <Chen.pj@inventec.com>
> 
> Document the new compatibles used on Inventec starscream-bmc
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>

https://lore.kernel.org/all/3106c4a1-ce5b-a9c4-5cf4-6adead7fce80@linaro.org/

https://lore.kernel.org/all/2e06e7db-64f9-51f8-adf1-b240f30a2608@linaro.org/

What's unclear here? You did not care to respond to that (the second
part of that message).

Best regards,
Krzysztof


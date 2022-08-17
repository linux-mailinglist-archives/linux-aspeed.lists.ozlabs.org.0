Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D077F596A8A
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Aug 2022 09:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M70TR0JPkz3bm9
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Aug 2022 17:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NEIEFh84;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NEIEFh84;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M70TF0ZX8z305H
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Aug 2022 17:46:38 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id u6so12786507ljk.8
        for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Aug 2022 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=6BuNS9KqOjvtc7XbSSlIG6uXhAeWvKuL+ywpXemmpt4=;
        b=NEIEFh84FTjEE3hoQnBHGsHnaml+UzRG01ulZUBdBSPLfmtu9cAh9yB3kLXEb7LJeE
         yN0LDW4bsQPRBtJ3VdL5/mNd8P1D9WPPFwsiUq6PHZNEEBcc2cj2FMGm+AdQf6j/X0Pq
         br/nZF42BY83RTe61zGApXTy8rFTrDP3Vq4N781RggEjZZIlKg2tV9LTlsMIYdgeyVXY
         djq7euigLcDRRwW/Sze5J6+Ez4khEzp4dfQeDzZDK6eHwymbd83ILn/6dNQIsYxEv/Qv
         LPwZ7gLsUWhcYjq+ljDrIRDVlJsEj8acd5WDj1tx024HECd3+5RmVRH935EPwTvT/jLe
         9TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=6BuNS9KqOjvtc7XbSSlIG6uXhAeWvKuL+ywpXemmpt4=;
        b=NjzksW7eeTN4ki1dHXrWzkUa+dqpc8C3PwLZoc6KlBt4JNJKSFR33xh+xuGj2Fb1Z6
         eOi6dc4AwAj+JYNGFMTZgYZPwLiw7/AR//kYqDP694ihLCddEJBUzr5HhIF9kyFZViDE
         45mKPBYv/74ExktFmrZm8tiDosNmCIbGUzZ7s4BR7Rup+dpm/h/HpIhjmG9vSkY5AmSF
         oR0/Z64huBzn/bOY+MCHvXTLFJUiScQmr4e5PGGVjQ4soLl4HEyn4vdA3nggerKgmydd
         cGl5geabkkItcd4sT9gSU3RR70C7rZopTiMeYwBgctysvqWkuhNVR1esHz0dpP/+3LLC
         8GnQ==
X-Gm-Message-State: ACgBeo2bGKUxAwuCkz2OlrvrLKyOM6A/eXprRH5x2aFza3WyI4L2Hhgk
	w/riLkG+wp/bHbSaYnNoYFyeIw==
X-Google-Smtp-Source: AA6agR7+bPFR57iuqYAZKnMHO1NMowGeL+VPcAK4pDjgtRZ+eqZjZeD9JBI30m3jn8ov9firTW4gGA==
X-Received: by 2002:a05:651c:4d1:b0:25e:5c72:43f0 with SMTP id e17-20020a05651c04d100b0025e5c7243f0mr7916432lji.164.1660722391873;
        Wed, 17 Aug 2022 00:46:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id b25-20020a05651c033900b0025e4ca99066sm2094142ljp.139.2022.08.17.00.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 00:46:31 -0700 (PDT)
Message-ID: <ee117d95-615a-e63b-64c9-c11f89b51123@linaro.org>
Date: Wed, 17 Aug 2022 10:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: document Ampere
 Mt.Mitchell BMC compatibles
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-2-quan@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817071539.176110-2-quan@os.amperecomputing.com>
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/08/2022 10:15, Quan Nguyen wrote:
> Document Ampere Mt.Mitchell BMC board compatible.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

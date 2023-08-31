Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66778E643
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 08:21:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RL7Bjoh4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbrdz3P9Jz3bV7
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 16:21:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RL7Bjoh4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbrdr2wdHz300g
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 16:21:20 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so506657a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693462876; x=1694067676; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MN3/KIBcA6h9wGDVjzSLq0W+eq4AFp91etA4VWB8MhQ=;
        b=RL7Bjoh4hlsHRlRqZYhw7dbKebIC4OW/xVCsHveUtu/6qZPJZn9MMMpQ/E6m/FkoQh
         g/W6kH0TtX2duALjTvTV/o5oE8+sscsXTEZK2dJFpSVAPqxdKeAfSC+YRJAzzTQp0l0p
         ZrRP/1QgwTnyuyeG1nQnwGAP6FhkciuvzqSKWBRB08EC6R53zz5iETJrn887xKvQtSNT
         PFr6gr2ST/o0QBGAYXWy8LDfTQaeIp8LuxdXRhozQzjjsYAoIEXl/3NNyPTLLMWl9H16
         dqiIdzRqZLQZFr5ye6AD5iIDsomKApQ2hPRBuVyidj4+hydwGPxb4B/xufiaxC838632
         RXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693462876; x=1694067676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MN3/KIBcA6h9wGDVjzSLq0W+eq4AFp91etA4VWB8MhQ=;
        b=K5zqZK16PcSzpbGsomJZxmz+Zlk5hev3TO5F0kjvG9smmE7RsIXwQ3wn2BLztsXy/z
         NoMZP6tGy+Js7G+ydc31prRMIxGcu8V3Orl2hkKDtG1jVYwTr+FCxmEEVjqIwC4QmoU3
         Hr4WNKz7RzwjSPV82RoNwbdf6mP1lLqgMKoDimXYO5jlVAxjZ0upfFVsaP/NzRAeoaYd
         A5NCjFSf41pWUodCJ0CLcbS0hjrKMKGnryAwvaWWLmwYgJ53d+mH/mP96NIG3mvNuH4M
         RFW6Lre5kjnKRdePvU23eQcyAsZ7SkiLeb86WwPsSJPB+MJbQ3b6Zs838rZVrApwMZXL
         95JA==
X-Gm-Message-State: AOJu0Ywlr5P89cungy2Et9PKi0aWkVrcBoUQqiWXD/vbDOdBP5bp8T2t
	codYwP0CaAv5xFK9fTrsO/24MA==
X-Google-Smtp-Source: AGHT+IFB8UbQE1K/uA5hBzss6Ee3Nu+tw1dskpb+vfsEvF2olxJ5G/EiW5Bu7rju/ULP+GRYIIUK+w==
X-Received: by 2002:a17:906:4e:b0:9a1:c659:7c56 with SMTP id 14-20020a170906004e00b009a1c6597c56mr3059069ejg.22.1693462876358;
        Wed, 30 Aug 2023 23:21:16 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906278600b00992b50fbbe9sm382001ejc.90.2023.08.30.23.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:21:15 -0700 (PDT)
Message-ID: <3eaa444b-baca-1ae0-039e-94f7811d216e@linaro.org>
Date: Thu, 31 Aug 2023 08:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
 <20230831055030.3958798-3-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831055030.3958798-3-peteryin.openbmc@gmail.com>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 31/08/2023 07:50, Peter Yin wrote:
> Document the new compatibles used on Meta Minerva.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


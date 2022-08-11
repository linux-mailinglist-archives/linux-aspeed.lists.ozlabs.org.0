Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8B58F7DB
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Aug 2022 08:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3HQ31GQLz3bYy
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Aug 2022 16:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dDnnH39F;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dDnnH39F;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3HPr3lBjz2xkV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Aug 2022 16:45:50 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id u1so24317132lfq.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=cmNxqUYbbLfZmfbn6Tid3MyIwHPmuvZvxKQRIASpPb0=;
        b=dDnnH39FkUvUgy0l6nKARiVgk7yt7GxvCQ6gp2l7ZNV/h5N3T1OrSku0vdzSSS0LhS
         qV8u9NkJZ1hS5eZF9Gu3txLeik9IAFaBrUepEQMsEr/i+eXBHjHwkFrWZWECFy2TkDKU
         mvkbAR8Z8GmphEE8R6BnH50FPNGYDbkTRWIQozJZ9mj4Fbajnh7Z+CJL5S91w9YFxvm7
         Xtes6KDd+K/P3I0oBYdhns0EfBVbrp6x0piw/Eq97I6mAEHAljGtFbNPy7crmxOs3jJS
         jydkGpAZH2IOT3fu7apq/6OAjD26mnlfwOJbzzYtnRRiIoe/QzzdhV45+iYeUk8rfzgG
         qNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=cmNxqUYbbLfZmfbn6Tid3MyIwHPmuvZvxKQRIASpPb0=;
        b=Wosnyz9Qi/Z6eb+v81vvEtqoqd3tcHdeXrDNUr9tgHyLS5QdsxTyJHrsVPW/flIqD0
         K8z1z8UUhmlfSkuVf/rZ3av/eOJbv8hwvFJ76MVFy052qo/rnQEBXsO4Hwaz5HdtFWBD
         pvoUPEirGPlHVlqB/IeXz+cWd9iY6bGEK4DFdfGYo+vQ1Jkxd+LSeZEFDJAg4x4Pyxln
         DKxF5NeyH3ti3BsAbW9vjcjCoe86fwLSbmnfjr0cA291QUqIjrbHbCqKRh97XvJETZzI
         QtETz7xlxBSJLJ65/a12rjIHXWSjM9cFXDUWK0ZJjRvgtZjmN41/JbI80jRXq81yQzZ3
         ypzg==
X-Gm-Message-State: ACgBeo2LqyBZvgmcA5iLai8+G6e2ud6SQcCLemqdGHtC5JDjMyIK6a/m
	kwzor1tqWBe7cpEfL88V3fGjLw==
X-Google-Smtp-Source: AA6agR7Re+Czo+MNniiu+JD9ZUTBya6sa260iSUdEFmdkGrWeY1rL7zbQ/JbU2jcq9T5znrXaW/AqQ==
X-Received: by 2002:a19:ca43:0:b0:48b:288a:632f with SMTP id h3-20020a19ca43000000b0048b288a632fmr11465484lfj.155.1660200346091;
        Wed, 10 Aug 2022 23:45:46 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id i63-20020a2e2242000000b0025e2c6b15e6sm688796lji.72.2022.08.10.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 23:45:45 -0700 (PDT)
Message-ID: <2bc9f4e3-51af-b58e-dc85-5623df799250@linaro.org>
Date: Thu, 11 Aug 2022 09:45:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] dt-bindings: mfd: aspeed,ast2x00-scu: Convert to DT
 schema format
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220810161635.73936-1-robh@kernel.org>
 <20220810161635.73936-3-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810161635.73936-3-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/08/2022 19:16, Rob Herring wrote:
> Convert the aspeed,ast2[456]00-scu binding to DT schema format.
> 
> The original binding was missing '#address-cells', '#size-cells',
> 'ranges', and child nodes, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

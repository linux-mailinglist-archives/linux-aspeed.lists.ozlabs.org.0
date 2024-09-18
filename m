Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A30EF97BF60
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2024 19:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X84dr6XtJz2yLJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 03:00:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726678814;
	cv=none; b=IZdDFexiAizL1AMub5yxHrZBLtW+JjB1O1DQ05aSAiS5OJ2HntiUnV3mxbxVKWtgOqHNRXvWYPj9F/qB53JBDCgzgaeR+9Iir+hNWFqWDi3ACH+ioM/n7bNsMQ/xKsnJ1auA8+K1gI26E2af60IT0h26r8Aid+m7FShK4DrfSEbjmPSPMG4ecCGGPqI9NW5v0hpN/bM2RKvWvWzEgNProiSBpPcc7eDwSOHKspjXdrXoSovQUPzPmQ69RkGQtu0Prve0m5auMf0XBcioDUkEW+zOakRra+uUE/wqPmNivqbTmphXMeJwwkMCvJ2AUT0BVZ4ISj0PAo1YaFmSlkOJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726678814; c=relaxed/relaxed;
	bh=I1+36+NZhDVwDQqZ2ssIFpr45WKecMP/sjx43vhCbeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYC4S4OaJE3HT0412pk/mGV9vbz5wyY25Lzs2pi2FMMdadqSWuJUB3146qPkYy3cLTMwBSozg8MvZLmjJ4q1+j8tuCS5XyoeDgfbEjlEjlVe9JieFEIhRQvo4CfIuXZ2aSVb6aJnFAFrapYKbceR5W7KgIhZQZ5NoQdg4Avo0ZoSNh0+WbQw6K090Ow7fZXHlTjkZNpJBC2d0/xzvj95CiB8YyZ39WMx5/XGZ9OywzYlU6YLx9WJRcWoxm7oP44aqu1AZLmEv2PFtyBwiI3CRaVKwwwbhnSH8otoVYs3/EwiMCT8WbIsxfvZMBWT3MV9ilrMs0Whp7O6sBhwAqn+og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VjVGJLAX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VjVGJLAX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X84dp3csHz2xHb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 03:00:13 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so764920b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2024 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726678810; x=1727283610; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I1+36+NZhDVwDQqZ2ssIFpr45WKecMP/sjx43vhCbeM=;
        b=VjVGJLAXBvSitCQ46/gx3KcqSLu9jOHdxpmR6HBiZmsY6Q82oX3TuQHjTStjKjfwmV
         Hw4LuAEmg+SrgSzi2uZ3rd0h44owGXb00D8zhh5S596IIn29hgBoPA25YQ3/DDdKzuU+
         REENHXq9CyhjhssOitX9u5fP6RBs+9Q/pmIfg/q0BrPj6QMEfqgP3yphtd9tb97jv2Jz
         azMCgB/FDCgQy1eZY/wKjXDCBZ+3CyJlzV033szNS2gugwXyCb4aaA/6/41KGFd19Pul
         KQR9RC0tUpGdv6D0KR8WgutL4bxwakNqewYK2jKrikF9iLEOz2DUrR8uisLCSvgsuT9Q
         IUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726678810; x=1727283610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1+36+NZhDVwDQqZ2ssIFpr45WKecMP/sjx43vhCbeM=;
        b=AMNRud6glrF6KFLL+f7LZWMGURKeqoWTfhwEl3rujjy12FrEAtlujYIRAxnmp61T3t
         VqEszUtgTHbisDrdMQF7UJZ3/VO9r6K/2PrqYIurAMiIhGQCQEw9DFLuv+gu7iqr2fW+
         k3J1St6EtTgUceNMjLXF4NfoyKLiBZOGhCLLY51aYHi/Qf1nVejfz3lJRLsrpjT4OZxt
         iznnpiKleaAjPxQz7Ce4cPBSwlWuODOgoxeERBZ+12hu+6VCj+iCN2BTCeidWdyfC9jh
         NQ2y/exQ/hSaDw+sF3joYdjfxvThJQ3YnwXaY8+wsBQVl9GN+uu4mhrBuwsHfuRIvnt/
         wWBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfjsw+Ni+428/wjXG/+XTNNzNikjQCSBkOscmQgxwVnCKzEHGu5xQWDbPYiNTtBVem6pHkEbHyuZBWMIU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWEZ0KMQs+cWVemmUSLcNKMO6/kqyHQCbcJFU3mkyTjQqN2sHa
	2wxgRmgF6r7fL5BSjn2Pmi1gtuNCHpeRtqYm5xzQOtGtiDtvq2oV
X-Google-Smtp-Source: AGHT+IFhp5c6rZituXcxVjcSwleChm8M8mXicRag0NAnlTUMWtXlovSdktNzbEIcDnLinAD0Vpa3Zg==
X-Received: by 2002:a05:6a00:66d8:b0:718:d4e4:a10a with SMTP id d2e1a72fcca58-7198e26c590mr419348b3a.4.1726678810378;
        Wed, 18 Sep 2024 10:00:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7b110sm6953943b3a.134.2024.09.18.10.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 10:00:09 -0700 (PDT)
Message-ID: <bf5258b8-a5a1-4cf3-9bd0-1fa44696c3b0@roeck-us.net>
Date: Wed, 18 Sep 2024 10:00:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: support MPS MP5023
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
 <20240918095438.1345886-3-Delphine_CC_Chiu@wiwynn.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240918095438.1345886-3-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Fabio Estevam <festevam@gmail.com>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 9/18/24 02:54, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> 
> Add support for hot-swap controller MPS MP5023.
> 
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> --

The hardware monitoring mailing list was not copied, so I assume that
the expectation is that it will be applied through some other tree.

Acked-by: Guenter Roeck <linux@roeck-us.net>


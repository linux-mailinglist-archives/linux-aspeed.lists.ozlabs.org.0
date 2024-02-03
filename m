Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7548848708
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Feb 2024 16:13:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q32zfoQi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRx3j326Hz3cBZ
	for <lists+linux-aspeed@lfdr.de>; Sun,  4 Feb 2024 02:13:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q32zfoQi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRx3Z2B3vz2xFt
	for <linux-aspeed@lists.ozlabs.org>; Sun,  4 Feb 2024 02:13:12 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6de3141f041so2275129b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Sat, 03 Feb 2024 07:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706973190; x=1707577990; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xN9WkJF6hYDK+c2hghOyEcly1TR1Vl/4IjxK+gN4NfY=;
        b=Q32zfoQi4aD/MEnvMXZWHEhim+BqwfZJm6+FITAvJLzlv23c8A1XJqLSbZk7i1rN9B
         7DNB7vihk4dNx9xa7OYm1HpXfJDL+GLc1UnMgpIuHeUH/+w/dIWoyUHOzXk01k7nZwoP
         SCPhKZR0PCpqWau9GwRS7rsppq4Ka80wZ1qtjSMakWtoSz75F07Mvo99Ke5p3ZM/K9G4
         Nb40lmGVSahb4lYayOTwZQCd0LaBm9CBvsdi5malTLml02T900sBn46mp3mreMLF3fB/
         o0HpysSFVauZWFyITuBqiAzs9G4FMe+PVxk/5FrRGWptpv9IDovsQnrgvNMhmkDhAcIp
         sS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706973190; x=1707577990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xN9WkJF6hYDK+c2hghOyEcly1TR1Vl/4IjxK+gN4NfY=;
        b=avTxtChglqWM8roePn0qmgnDFl6w+G9Ygwoc276LOUGdX93IipEon3H6pESPYJgFHn
         WIcVhJRQon9pCYwaAEk0vQJj5w4sEO1X+Xxy8EIH85SfEhx0v8TsmScK2zlZjL0KPr6L
         5IXgFCbQnOp5BZpbSxZEvHzmyUlMGDaU/NQ7FWhuSahY3mC6HJCJXRl4C4VSgWMkml46
         ETBuBgNSrckkbGlAiSnvDG6G3Y+grqv124JrH6cHno30UwMEgi287YhdfjJTPinshJ89
         JwS6EjDJcUDhwjFjGDHEqY5VGVzPBpiix/5rLbvyGe3qNyPKGS75JJsK+uTiRTMv0ITh
         7D7A==
X-Gm-Message-State: AOJu0Yysy1L/QHUwJ3SCRFY8IssEKU/R0B+6ix9+JkkdVofFrFaPQ+56
	fmPyZkGGrChQtbsQoQbC3E59LiLfeREbLi+qFDIBj0l0IOWbCJbx
X-Google-Smtp-Source: AGHT+IGzclwUEWMRrB7qUW7wMZUYvN4KbDaWuMK5T/g9+YsyjQ0OdD5a6sVLWIN+82c2yQmSgWYBeQ==
X-Received: by 2002:a05:6a00:1407:b0:6df:f634:4f83 with SMTP id l7-20020a056a00140700b006dff6344f83mr6028980pfu.2.1706973189541;
        Sat, 03 Feb 2024 07:13:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUqYJZtF0397o79UzP467rq+EAXWG13ZCkuGdHXaZvG71bKhtaZ87yr7V3NXIZ4NLnCp5BZJCtLrJoXZAvzCQja+f1KOfybqtNT3eANB/oh3C1NGHWrKwehgCcO1ZoJWFzCG8l9NENaMXsUitkqyCf+tBUR8DPmy0MzKRMF+fceGoyC07gWeQIC/+j8+A9AY2PUVsF/oR5RJG2OiYXEtUeAn9txBrXtmxbbctnYemk8oyh5Ds1FoopUbq8VbebCQlvPAMdoP1SL+8aMgJzY4bn8Y906L7Ln31LNTfXN32Y/7cLg/RtQN54lUDUCa59F9HSRZWMxOvy/E5NQf9HvxxK8wFMxgvAksmEkf59tqFRV3Z2NYW+G73xa3vhzLN3x8wMHUy36RY81K4pEVeHwaPF2m3jCz70uno3P3cGWYzD7w6WbTsfyh5+Y4k1QcnWMyTsaTp214+GkWDcqFV0LYvNpHTpn028grAIXbj05NYX5kjklvxeBjCPgndBnHoKVcRCDnnRqSzIUu51mTEdzgvI1Q2nZjBdDxkTvpNq07AsalOaiJ1/HqSt0PGeI1zEQOfauB6xDTFgRiBP1M4kuWN+uKOY4VEfi4oA22jZ4Cmb+NicUk9EJt4J85246qjNKaH1aRLitgP0sJQ4VlP8CuzyKJtZ91RcILRYmL1NxX7ZW0w0nuBUyRqKtYA==
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b129-20020a62cf87000000b006dfe45dfdb4sm3671627pfg.74.2024.02.03.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 07:13:09 -0800 (PST)
Date: Sat, 3 Feb 2024 07:13:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: hwmon: fan: Add fan binding to
 schema
Message-ID: <e1b1c69f-a2ff-4fa5-80a6-3ff0a3de6ce6@roeck-us.net>
References: <20240124060705.1342461-1-billy_tsai@aspeedtech.com>
 <20240124060705.1342461-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124060705.1342461-2-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, BMC-SW@aspeedtech.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 24, 2024 at 02:07:03PM +0800, Billy Tsai wrote:
> From: Naresh Solanki <naresh.solanki@9elements.com>
> 
> Add common fan properties bindings to a schema.
> 
> Bindings for fan controllers can reference the common schema for the
> fan
> 
> child nodes:
> 
>   patternProperties:
>     "^fan@[0-2]":
>       type: object
>       $ref: fan-common.yaml#
>       unevaluatedProperties: false
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

v12 of this patch got a Reviewed-by: tag from Rob.
The tag is gone in this version, presumably meaning that there
was a substantial change.

I don't normally do this, but I downloaded v12 and v13 and did not
find a single change. Why did you drop Rob's Reviewed-by: tag ?

Guenter

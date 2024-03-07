Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA5875649
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Mar 2024 19:47:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OY2XjDmq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrJFh4Zzmz3vb6
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Mar 2024 05:47:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OY2XjDmq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrJFc0PqRz3vYd
	for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Mar 2024 05:47:31 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dd2c8f1204so8941235ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Mar 2024 10:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709837249; x=1710442049; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHpzYF/0bnFdQReqCSrANQ8S9kqO60ayYearnoZhqOY=;
        b=OY2XjDmqgg4pNAzw11UlCCS0AGAIlzZX4+tCZVk+QqXwHcDxp5DIwHTXoF+vXJifpK
         MNCNtt9iaxawlVCA78fOkzqpGHHtmhghWaxAZbO5IcCUVJaE/qF9QjzHL3bvRPCnrGn1
         bvr/3BcDP3d+3B3RW5It2fCrxdbrpPtvusFuLPtpxvqOoeuJzI/FYTOlS10kIYNpdQks
         sQgt842abXHe+v4JJ2D4p6ns/Li6TkwDAu28zpDPHAAgjYnF7/4k9aM7ehwGw1lpn2Oz
         TB2t6sPCiwPOPh53NAzw312A/WmTv5v77R1sffkjwdug7jnCqhoNLPRcpOHx+FtmRN23
         OLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709837249; x=1710442049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHpzYF/0bnFdQReqCSrANQ8S9kqO60ayYearnoZhqOY=;
        b=vP7MIlLhsucTqidqnvxeoWLUODjLDwAGFKdr2vzCUUfmkpUr7BIqmHcjYNC29w9Ghx
         U6RhtvMLaiBR6HpmxIO3jHu1n+YiE27F5t9Z1j263lfGEMVQWoiUNEjGOKk2FiLA8bLL
         VsrJTo4XGOyIahGj3EQHPMexTEp5/1bCFXQpsltL5yEedAnpvvZ1218WIDqVmv8gf5Pu
         dhMztjtOB1toFJBugoDlAXotAweudIRude30H11iKXi+oozhC9Fa/X8ZHsZr6N36bFfV
         waqnNp8d2wzBLh33Zdo+0kbAgeE2n49mOMafNO9Da7PoBkR6ayiPrBdKCmfPoiRLJkIz
         CJjw==
X-Forwarded-Encrypted: i=1; AJvYcCW3RflHrpoemOWOW29ft/tY9vVbOc0AkeCnWshk+VGGQVxe0VjIolnNPuKbuXiNwm6Fu0Kle2PtldnylRRDJG/1o6U5caoMTZybCI9pMQ==
X-Gm-Message-State: AOJu0YyIOsktOAo2R2kxjWh4ZI0vUkvQPKObfU5Zw09PfMBEuD/GZanc
	msX2BTkzIhkQFJTR1/L+nauUTTH1HUJcpuTmfPnrRNp+Ygwrzkjs
X-Google-Smtp-Source: AGHT+IGNvfC7nEsN4ksF8HVdz4D1aKcLKzSw6No+jys7cG8M3k7dVGYWSvmAeqG129djEdvLimQ7+g==
X-Received: by 2002:a17:902:a705:b0:1dc:7887:7723 with SMTP id w5-20020a170902a70500b001dc78877723mr8441038plq.61.1709837249003;
        Thu, 07 Mar 2024 10:47:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902f68400b001dcbffec642sm14862818plg.133.2024.03.07.10.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:47:28 -0800 (PST)
Date: Thu, 7 Mar 2024 10:47:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v14 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Message-ID: <a7ace5d4-5ede-457b-835a-f2e9a82e5359@roeck-us.net>
References: <20240221104025.1306227-1-billy_tsai@aspeedtech.com>
 <20240221104025.1306227-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221104025.1306227-3-billy_tsai@aspeedtech.com>
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

On Wed, Feb 21, 2024 at 06:40:24PM +0800, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm-tach device, which can
> support up to 16 PWM outputs and 16 fan tach input.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

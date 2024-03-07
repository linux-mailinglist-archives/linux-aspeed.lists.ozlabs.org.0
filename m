Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A5875647
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Mar 2024 19:47:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PVEknYkx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrJF138s0z3vb6
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Mar 2024 05:47:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PVEknYkx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrJDw3cgcz3bsP
	for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Mar 2024 05:46:55 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e622b46f45so24526b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Mar 2024 10:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709837210; x=1710442010; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcSPzX8M+QJFBTpk7kbACEk4HaTU8e+pItsUzx7AYC0=;
        b=PVEknYkx2W5INE2KcsJRgUWYr+r3DBS+0hQnQsBX19Sx9z9N781AFQy52Pfw+eNckk
         1gyf7doytf4jsSXu6SCSajfUmlJdXlHR28ah4mArwWnGR5Fx26EZzk3c7l8ZXyaO7Epp
         2UG4uz0nEVqW2uMrG6zAGpqFBOmk5kbYCQXS1YbDjRHwXoFd2gHHraMHttolU6aTAaR+
         uAFEaIG7yMCo14Q9owYhZp8TJTa/cM6l1inpKDXTxLEXvZOGobL4iuxk8BBMIcmewgCK
         1YbdGeyl+SYUTSG8ttTQRvBqRz2XXD6oFHxCL8pG0/n6YFoFhgKLEnMuJ4N14jNTDpTi
         JHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709837210; x=1710442010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcSPzX8M+QJFBTpk7kbACEk4HaTU8e+pItsUzx7AYC0=;
        b=Tg5QAznOLjyMC+K+NTjOWvofS4aNln02W/3NgIsXG2jeTalWtacFdekPZ+oyxkg1hF
         d8LDtfCYbZOZo2mqTR3co9q6c9TVS4Pq6bdN1zqFgebwrw4qetQC99d1Qso2hBZyNXL2
         l7lTmkGaWcccZRfRrbO7dRsRWS0PY8E+bDUPS95v+m1s7c+apNXrPEks7J6qKdE2rKUL
         30SAE4r0pqzD26Yhy5EhPp48sffs+yQ09aWN8EyqynzZD6xwwVVEMmw48zCbRGB/nA8v
         TS5iTmCRznyvRm95N79MmRm5NnehDo09ArS6uIjhmnakOOAwDFeyxxzp9s6DWxRIaVnw
         PmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdMMiFftA7Ur1FpctKEolCKbg/nec44AuosHxuswmHYgNd2zu0TSZVy6k0z5Dob9ndNQw5/HiXPROZv3+zmwMDnWUpLPfGUJivCVQYxQ==
X-Gm-Message-State: AOJu0Yzn4LkTUlqLmOLkav54qYyEbsKhHqobPnH7UpkwMiqOP6ChTFb7
	sZUDEMp+3rM7fNHiITxWmyJoFslTW/Msi3zNjyTFJAuPfDR3r/42
X-Google-Smtp-Source: AGHT+IEBJSEWz2wy7Dv0K1kwfxrU/6G1C8RKBk1lDzsP1RDNJGc2mXNjfYg/byRXJBjvJK4Pk11AUg==
X-Received: by 2002:a05:6a20:d48c:b0:1a1:4757:927e with SMTP id im12-20020a056a20d48c00b001a14757927emr10795472pzb.33.1709837209646;
        Thu, 07 Mar 2024 10:46:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j20-20020a17090ae61400b0029b2eccd158sm1885043pjy.48.2024.03.07.10.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:46:48 -0800 (PST)
Date: Thu, 7 Mar 2024 10:46:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v14 1/3] dt-bindings: hwmon: fan: Add fan binding to
 schema
Message-ID: <11ad14bd-bf25-4c07-b704-46a744071ead@roeck-us.net>
References: <20240221104025.1306227-1-billy_tsai@aspeedtech.com>
 <20240221104025.1306227-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221104025.1306227-2-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, BMC-SW@aspeedtech.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, andrew@codeconstruct.com.au, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 21, 2024 at 06:40:23PM +0800, Billy Tsai wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Applied to hwmon-next. There have been a couple of questions, specifically:

- min-rpm of 1000 seems low. Fans with higher minimum RPM
  are known to exist.
- A default value of '2' was suggested for pulses-per-revolution.

Those questions can be addressed with subsequent patches if needed.

Guenter

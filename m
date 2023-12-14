Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E2812404
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Dec 2023 01:43:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=E/Dw4uGk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrDB51yJlz3bd6
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Dec 2023 11:43:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=E/Dw4uGk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrD9w55hWz30fk
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Dec 2023 11:43:46 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-551f9ca15b4so1766109a12.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 16:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1702514622; x=1703119422; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RLpB5md1tEE7IuK+B3sruEQW7P8lycC54rVRstoSoLw=;
        b=E/Dw4uGkJfRiA9ZXRTWmDdRGYA7p6olS7eRjOo5c6k7JQNyuXrhBtEhDaKbhqodoeg
         IU5xUCjfZujLesI6qAU5wBgjwAloZIH3w5fFt7QFW/MG0t8VKTdm2j5xYvRrOaR71/x2
         hlJ+pjnAGWRG9+6MopqwWvUkcHTYb5wtUNSFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702514622; x=1703119422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLpB5md1tEE7IuK+B3sruEQW7P8lycC54rVRstoSoLw=;
        b=rEWzGc5yaR6mJwfrfRV0bc4tJUtivkPKUm2Pqxqq0hM/TjVXmf9G1KtoahVp/O4H7M
         hgJeGt6fmvpfCX4QAKGGxJuu7tLcnIvE8/OivRwrNkBijY122vqFWy5P6uVdrz7+sob/
         P7HcpOOhzTsqcqBKmHqDMnYSIeFSQxhDm/TwbVKTjk6jpfFVv9Y+IHDCuLFwY3xPfue4
         0xvufhL8cJy5QzFUSooHPxc6H5gGdffKX+9lkaNHAEYb/BLZaofwIMUQBpPBVL2k+O3h
         RkNm2OSWADyiXGfwk+IZdAZjaQGs4AyHCMwPXq3l+4/eeVRwTMFxvMr+wgPuttuCUXuW
         DwfA==
X-Gm-Message-State: AOJu0YwlunHi7iMwJflbN/HaRhobUkcPumrZjnSexdhb0GIzEgzQcZ9T
	utG4Vk6c5E7mRaAeEwZrsfzKceTDSkVJlwwCpcY=
X-Google-Smtp-Source: AGHT+IFa9Zm+LfMZFPUZavztuLcHzT2Ycn1Vj82hIrX/b4xCeE4xJgbmsr48xQ/aHgS2Y86FFkv1fdkhWTwCmE5Nadc=
X-Received: by 2002:a17:906:1750:b0:a19:a19b:c746 with SMTP id
 d16-20020a170906175000b00a19a19bc746mr3703966eje.150.1702514622267; Wed, 13
 Dec 2023 16:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Dec 2023 11:13:30 +1030
Message-ID: <CACPK8Xc7XjgBj-SQH45=omjEXd-BpXgcQDp6s8UkJ8QsbnYSPg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Modify DTS of META Minerva CMM BMC(AST2600)
To: Yang Chen <yangchen.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, robh+dt@kernel.org, Leslie.Tong@quantatw.com, krzysztof.kozlowski+dt@linaro.org, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 12 Dec 2023 at 18:24, Yang Chen <yangchen.openbmc@gmail.com> wrote:
>
> This series modifies the DTS of the Minerva CMM which is the board on the
> META platform that uses the ASPEED SoC(AST2600).

Looks good. I've merged this for submission in v6.8.

Reviewed-by: Joel Stanley <joel@jms.id.au>

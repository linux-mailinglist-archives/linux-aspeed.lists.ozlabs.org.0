Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B4C951E15
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2024 17:06:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tAiYKLbk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=j6DzcVXm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkWmc4lSBz2yQG
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2024 01:06:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tAiYKLbk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=j6DzcVXm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 106241 seconds by postgrey-1.37 at boromir; Thu, 15 Aug 2024 01:06:19 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkWmW2hQjz2yJL
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 01:06:19 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723647974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kgBDpLd5CRpFg6iGANviJjQZYBMsab2XfI71ntFAp9M=;
	b=tAiYKLbkjpo3vw7vm6WQ5c7NaedPhBkRMhEoTNaEjtTBNkJoxXr6ch7ieW7REJBS8Bs0bI
	MFa+tPwBRX6tlTqzlOkNXKFJqYGmLWvZ9WDysaNEfAhIcaMlMI/3ygGfLmajWqPhFF0s1q
	yT7MMOoKP/YEViRCuJ5mO2f4hMzUtha0fAnOq2umhbBZi0VcQ0vMSJrGAZoJytbmAFBTxB
	Jo4QqrkLTErYRR4AuF56fvGbFdAjnb6Gdd9bnE0wb1Il1fxN7ZzfA3Pcy7BI+FfXzq+yTq
	QSPBPJE2RvXKhiKEaXARp2eKHeRbb5B6myXbMlqM6stm/qlbobkrr8b1LuygZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723647974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kgBDpLd5CRpFg6iGANviJjQZYBMsab2XfI71ntFAp9M=;
	b=j6DzcVXm1ZA8IVRQAornEXvVYXU17kS2Dzdyv1mD/k0CSU+9aqtNO+Omhv5JKo36g68YUk
	Me2HS01vDRJm2JAA==
To: Kevin Chen <kevin_chen@aspeedtech.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, kevin_chen@aspeedtech.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
In-Reply-To: <20240814114106.2809876-4-kevin_chen@aspeedtech.com>
References: <20240814114106.2809876-1-kevin_chen@aspeedtech.com>
 <20240814114106.2809876-4-kevin_chen@aspeedtech.com>
Date: Wed, 14 Aug 2024 17:06:14 +0200
Message-ID: <87plqbnnyx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14 2024 at 19:41, Kevin Chen wrote:
> Support for the Aspeed Interrupt Controller found on Aspeed Silicon SoCs,
> such as the AST2700, which is arm64 architecture.
>
> To support ASPEED interrupt controller(INTC) maps the internal interrupt
> sources of the AST27XX device to an parent interrupt controller.

This still lacks a Signed-off-by: tag and my comment about the error
path in the init function is still valid.

Do you think that addressing review feedback is optional?

Feel free to ignore it, but don't be surprised if I ignore further
patches from you.

Take your time and go through stuff properly and do not rush out half
baked patches in a frenzy.

Thanks,

        tglx






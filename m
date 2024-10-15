Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9761B99FA85
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 23:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSnnD31d6z3blF
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2024 08:49:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729028974;
	cv=none; b=nBRAwW262rPuuW9nsotpO3BFfx99nZEbRsd0YrVbgAq5hKoAdV652lEiio6t4639JP6YQeIUo/VndZqLmWljhzoFlfnJvw57O0c+eTJgwDr/XJ2KdHmtbKq7XlLJiuYj7+UVk+n7YNpjmDiBFcKd5W2bnnQfXB6c12kCTqeZW3Ncm67SuJLG1IlyEVZDPjeuK5USxU1G8luaaUJd5sPtxTpGPGa/4mb3us0qk+6+bmEbwFIUT5+o0fMzGwjKBDgqKqkCXJIYyPmbWcGtrsuV4fxzDGrKV3oI9wbYfjVjaaeZONMh1Z9pVeGxh3C398ki6IMpsimiFpRN29+58V3C2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729028974; c=relaxed/relaxed;
	bh=hALBkgP+0vHQHFOLfJVhzpCvZiu7iqZATK+f8xljF6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X2MTQWhjENZ1t6sM1NGv1TGb4XycyZ1LdrMObeDuXnoc614zbWs9+6DuSqPQbSa1gwtpWJlU6RB0aXGmMFTodzvmqj3UuwG6H24zlwIB3Jvt3Tyzl1/16OVv+fZrmqbEIXXKMo8XJcOHn9IneCkJOTBCUcAuR+JmQLc9FtDt8a6vnr98l+ll8ROkDMLJJRokKySyGv0HH9595jOdW6vDH1jDKDjdL7Lq78i2jGU3U3D3BSO4ofvcCIEI2nSg0xXkVfcO/TTM+ACe1k6r/X8KJ5f1sCYm/DueCzS1qNkqS2+2XM4DJpqQyaHZeEqn2o1pMuI8MmXjihuRpE2O7dmrbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Bs4WK+3i; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4GA+ftBD; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Bs4WK+3i;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4GA+ftBD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 417 seconds by postgrey-1.37 at boromir; Wed, 16 Oct 2024 08:49:31 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSnn71Xtqz2xy2
	for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2024 08:49:31 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729028543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hALBkgP+0vHQHFOLfJVhzpCvZiu7iqZATK+f8xljF6o=;
	b=Bs4WK+3isP7DKVNVaTNUaI/cX7y8ywrDgKgH/p2ecpxNUxJJo0bfpcpQ8SK4BcXOY2CYJQ
	koe/V5rgwmYPy4OWcSKmFZbCAnO4X1fTHuAcVGFm61OmX+gLgw0WYIvAimHF/WjW3WvyzH
	SCWMpw4lmBbQGc18oHIUM1HiDR7eaiJnFh3+YDMdDoTYHCvxulNioczbrzxxErJ5PRSj+P
	D93sv4JPFkjAYRaW9BAAMV+Cv4RpA0dmVS+s5qKqYs0Vh8Rat09h+FJ59ePaDnNdymW+ce
	nbD6AcfZIse28KHvl5QHb6eJQY84fpgt+5/ZGIpET97fj9/LBur6aj45bZQMjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729028543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hALBkgP+0vHQHFOLfJVhzpCvZiu7iqZATK+f8xljF6o=;
	b=4GA+ftBDLrodNSL6IIhR1BlPC9NDD73LIkk4yNdYSvee3SIv688WmN65Kfer6AZf+2rNDY
	GP+ZpDSLkttq53Dw==
To: Markus Elfring <Markus.Elfring@web.de>, Kevin Chen
 <kevin_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
In-Reply-To: <f65dd139-1021-47d6-93a1-1477d6b4ca1d@web.de>
References: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
 <f65dd139-1021-47d6-93a1-1477d6b4ca1d@web.de>
Date: Tue, 15 Oct 2024 23:42:22 +0200
Message-ID: <874j5ddow1.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 09 2024 at 14:32, Markus Elfring wrote:
>> +
>> +	chained_irq_enter(chip, desc);
>
> Would you become interested to collaborate with another scoped guard
> for this programming interface?

Collaborate in which way? What are you collaborating on?

You are merely asking people to do work which you think is useful. You
can do that, but that does not make it useful.

Making a guard variant of chained_irq_enter/exit needs some thought and
a general plan for cleaning the whole chained irq usage up. It's on the
cleanup list already with quite some other items.

We are not adhoc adding a guard variant because guards are hip right
now. And no this does not need a scoped variant ever.

guards are not the panacea for everything.

> https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/irqchip/chained_irq.h#L13

Please refrain from these silly links. People know to find the functions
on their own.

Kevin, please update the change log, add your SOB and move the local
variables (unsigned long bit, status;) into the scoped_guard() zone.

Leave chained_irq_enter/exit() alone and resubmit.

Thanks,

        tglx

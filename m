Return-Path: <linux-aspeed+bounces-3494-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OXaFEI1h2nQVAQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3494-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 07 Feb 2026 13:51:14 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAA105E5B
	for <lists+linux-aspeed@lfdr.de>; Sat, 07 Feb 2026 13:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f7VtW1TXXz2xm3;
	Sat, 07 Feb 2026 23:40:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770468051;
	cv=none; b=VliGOJG8vUFRb/drhRQ7wLjyejz512KPvwus5MsFyvgt4K2/9ADO+JAPiqY2KDwxtZknXEEY8rlLx+G4BxSMshbb6FGJnND/oRjuTltT+ZZMuAjiI563WRwAG/WYUwFnX5i0BEuIIP4B2jRXU0NQ0wxHO3/C4yUval2GBQULoMP5j3BVNXOt2LqrOCf/dcUeKHiLWYmfxnfBrJLPPLlpOYenJL1s9bQOy/djvLafqDs0FrNCvT4LSMw8AlHI1cVbC1maq4ezplkhJUAiqCXwuhOwsP3kx8DkJXRECjlokoev1YUiKKrM+91mUcp9dAtgPpkximvx19nNJGvDJOp1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770468051; c=relaxed/relaxed;
	bh=u7mw2REIi5YvReIN1++C/n4doj/HVhTauIRAe2doeMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iW5+9wd/WJ5xU8yndwY/waoC8NlgeIqvfKVCuLHaa9lWcR9NHhTDlxARvzMoqc1h2NpREnJs2x9NotYbjpGmY5ZuJDT8bQWmvrbOtiryIKDd2P0WMQvd+uJJOcHvyCPMSQmAQaGanAV/1rmrHhHLwzOozHxxk6TBWqVtnd8NFmIUGJ6dJF07yu4A+rOXmO5YFfWYELSzXEQfQImUCHI67pvymQf//rTBrZ83FTYtd8TN+SsxJGhZADruWDm6oYb5EVV6gnoSuBJsEzsoQPnJicwFEIK7nLGyUeV7YNbaKzx9nICE8I8yx9nqyA9fVtEuguQ5TBntCrrbXBOvyKKKOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IHUEfbEs; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=QRPaRJuX; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IHUEfbEs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=QRPaRJuX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4f7VtS6PvHz2xWJ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 07 Feb 2026 23:40:48 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770468039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7mw2REIi5YvReIN1++C/n4doj/HVhTauIRAe2doeMY=;
	b=IHUEfbEs7jatAyG0QJUXYH7tn0JLEYfYurUxGzjGRBE5e/M9QAME/qZ7DMNVU5XfxXe65N
	f9JmkBPSVMEEpywPQHJlcAHkoea0xia8FeK1YwmlHfg5SM/Q69haYUN/oIIUq+Y8TIifmg
	O1e3UdPaw/6WwgB9BH2nDW+Vv8ZvdQ/NXAoAZ9GOBi1KpVg7uenYmJ+o77Dm4KJYRxK0a2
	hD3R0XP6AmRTUpJIa+Fer1KHRIazZqiquew3rMZdN9FUwaTMu4Zwy0B3g2rFqAi8JxlzDr
	YYYivOb1WjwDFuNz/lLzSxgeOyDgRBipZqqfA/B5NakR621s/EYifdFxOZzDZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770468039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7mw2REIi5YvReIN1++C/n4doj/HVhTauIRAe2doeMY=;
	b=QRPaRJuX/plnEzL6PBt2E45uECSGwK6YLL3plNVB/bNviWky8Y5y7+9Uu94qN9CMnFSj6E
	XRbiA86rYYsGjXAA==
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 2/4] irqchip/ast2700-intcx: Add AST2700 INTC0/INTC1 support
In-Reply-To: <TY2PPF5CB9A1BE6CC5EEC90EBF13B083D1EF267A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
 <20260205-irqchip-v1-2-b0310e06c087@aspeedtech.com> <87h5ru14xx.ffs@tglx>
 <TY2PPF5CB9A1BE6CC5EEC90EBF13B083D1EF267A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Date: Sat, 07 Feb 2026 13:40:38 +0100
Message-ID: <87sebczpyx.ffs@tglx>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.29 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-3494-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:ryan_chen@aspeedtech.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@linutronix.de,linux-aspeed@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@linutronix.de,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-0.949];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,jms.id.au:email,aspeedtech.com:email,dabbelt.com:email,infradead.org:email,ghiti.fr:email,linutronix.de:email,linutronix.de:dkim,berkeley.edu:email]
X-Rspamd-Queue-Id: A5DAA105E5B
X-Rspamd-Action: no action

On Sat, Feb 07 2026 at 03:50, Ryan Chen wrote:
>> -----Original Message-----
>> From: Thomas Gleixner <tglx@linutronix.de>
>> Sent: Friday, February 6, 2026 7:34 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring <robh@kernel.org>;
>> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Joel Stanley <joel@jms.id.au>; Andrew Jeffery
>> <andrew@codeconstruct.com.au>; Paul Walmsley <pjw@kernel.org>; Palmer
>> Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>;
>> Alexandre Ghiti <alex@ghiti.fr>
>> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
>> linux-riscv@lists.infradead.org; Ryan Chen <ryan_chen@aspeedtech.com>
>> Subject: Re: [PATCH 2/4] irqchip/ast2700-intcx: Add AST2700 INTC0/INTC1
>> support

Please fix your email client to not copy all mail headers. If you can't
fix it, remove them manually and replace it with the usual:

On Fri, Feb 06 2026 at ...., Thomas Gleixner wrote:
>> > +	guard(raw_spinlock_irqsave)(&intc0->intc_lock);
>> 
>> s/_irqsave// Interrupts are disabled when this is invoked.
> Sorry, do you mean when this function been call.
> Ther have desc->lock to do the raw_spin_lock_irqsave.

The core always holds irq_desc::lock with interrupts disabled when it
invokes those irqchip callbacks. So trying to disable interrupts in them
again is a pointless exercise.




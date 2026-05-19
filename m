Return-Path: <linux-aspeed+bounces-4084-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GcZM3TDC2qWMQUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4084-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 03:57:08 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8D576353
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 03:57:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKHq33Ldsz2xrC;
	Tue, 19 May 2026 11:57:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779155823;
	cv=none; b=G9xCqsTcylMsNFeWS0JFesimesLqr/TPmZF+fazgUImtm3xBYwxIMQnNRmpJFJqV3FDYTvP3vS0ZF7Ex3B1C93Lyk2HOyKQLeTZ+VhI/2rKGn7nL+Hk+esV+tLHFKgxQtcCNde65Sk8htf0V0ZNLhri98+xI1BRxH2suoixNa9NDO8jVa79EoWBWhQK2/tJqhIe1tMm0CJ2SunsiV/JgBauViK74/GBI8u88dFQh1r/LmO/j6ulO6dALJ5nOSKaZKr1G+xtnz3+OHeBKvv5jCPEotkzWAGAVhaTbXc3odQkIsZ71+cv4quUqENWkah0pUlM3/u0dKuQRTnegrfKq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779155823; c=relaxed/relaxed;
	bh=+s0IvEn0QduM+NAryTI1PSdqYWmoLeqb5O++XMz3oOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ADmi1eVWVDORRQSTaICOyYl7788TPnUFBCUMAjhgh4anJ09ydVIPbp4BCkVUixz57D/NQfLo1FPd8ZB87svMyunFKaud/J4BPPLejB+WW9VzECl3eQKLAuyCIXZl0QvYp+HjJH4V87QkabDAIChHb+kwLcVYCYdSSMQ1YU3HtuxcrLEmYWdcBk3qjGTgrcaj89anpWwMgwiJ9o9UKlP4wmZuG4Sxxhnp+dhy+mMMW86Re4NrFZ4duJqGGox3E73LTOA4KE6pduljAyLbdpHh3WGnuQhpD2NtcxGiETP4zYx0LwioZGgoVDKaKyiz3OiqyXvZN9teYZ0Vhqi9FcubJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fmsUIgxt; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fmsUIgxt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKHq25Y5Pz2xGY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 May 2026 11:57:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779155822;
	bh=+s0IvEn0QduM+NAryTI1PSdqYWmoLeqb5O++XMz3oOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fmsUIgxthdrTTcu8M50vmX7XAI/IclFp2ZBtqRSo+0ldwe6FoGrnvbvaZQyB0bCUY
	 8GO4Zq6vJ+9h/Bb2E1wYtLqQKYNLrBHMw6D6/OGayZ65QnINC+NGwD9Yv8utM4D33u
	 xc/twRHI5UE0I8ba5Nh+ZuR9ArK7HGt+7iUo/kIBmo7J1QVVpaHYC6K38/EQOvJZqC
	 m1b4AJ/UPwop5RYahz92TT0XHcrZjVTyyVNqTj7gtXAahIzOCeGRjW0koF5IykJFdZ
	 /dQ1wU9L+t1LZk/C562JZXRz2Xl/43QCV1CfCqceJs0FIdvEL7S+/vO3VlRqDAJBD4
	 IIyjJV+/Xsnvg==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9E2946025D;
	Tue, 19 May 2026 09:57:01 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Rex Fu <Rex.Fu@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260518-anacapa-sgpio-edsff-thermtrip-v2-1-e43b1847b2dc@amd.com>
References: <20260518-anacapa-sgpio-edsff-thermtrip-v2-1-e43b1847b2dc@amd.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: correct SGPIO names for
 monitoring
Message-Id: <177915582159.2591185.16167968978393310497.b4-ty@b4>
Date: Tue, 19 May 2026 11:27:01 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4084-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:Rex.Fu@amd.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 5EE8D576353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 18:00:40 +0800, Rex Fu wrote:
> Update several Anacapa SGPIO line names to match the existing platform
> hardware design and the signal names consumed by userspace monitoring.
> 
> The previous names did not match the actual Anacapa SGPIO usage. Some
> lines were named as CPU or CPU power-good signals, but they are wired and
> used on Anacapa for EDSFF presence, EDSFF power-good, boot EDSFF
> presence, and thermal-trip assertion monitoring.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



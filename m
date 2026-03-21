Return-Path: <linux-aspeed+bounces-3732-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEeyMDC+vml4ZgMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3732-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 Mar 2026 16:50:08 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D052E636D
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 Mar 2026 16:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fdP5S595Vz2yds;
	Sun, 22 Mar 2026 02:50:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774108204;
	cv=none; b=auBJhBRqTZ8QPk7NDXnQTNovBhTrlQZ8GXE/weux/v2HuLOolSKuW5y9WnGNdp1HqUgIswOpDaic64HK/C8LwTwe9zRQxT48vOrRc3Iy3JoTe16Qgb1MT9jclrnmRiVS3RwqUBNC9VI0xuxRTCIPZO10KagpKXJmyY5z5bu+dRm0yxlmCQVWtDTdtQvSzHgzI5bPK6LYp5cLAkGILIH02krCHVcd1fIa8Iy3jdQs5AN2T06j39COLSxp5sGfs+V/h3604DXM+q7mxPoEm/hEKiLo9Bjei0UCaJ5rwCx0/YKB8coyo8n1b6F4GJ4WzTsl0ug9Nd07HA3h9tFOUFW4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774108204; c=relaxed/relaxed;
	bh=BztVlr52jyDB/PMooczhe78cc61qz4qlqThyVP3NYvo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzpPy/kyVqLJKZHS9T236ItqVu9odcNrZ3qW8E/PDnMSFlyMJFWo60QoAmQZWohQgEL/M1puG/JeuAhctb5cCRQdu4aUsrvCqIAm6Fz9QEyNlFOJpCwzCl8sOUsNCQB8qHP+FdmfWEDVOxfWj+vV4MBw8AOLzZI06wVLYjP2R+XQpPxHKTrAQu44PVCd2aF5JrnzeKfjVcJjcmdNb0QY1i3J2Ww6KQduRhJO7dt+i111kXDYhsBXj6c/eFXp3D7JWgdRc6pGaFuQ2r8KZxuqvuRUKkHgc5P7nvRiHFZoIjexd+uvWYwq90BCUqqP0tEOHe/ePa4fUMGoGLjNdHN88Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e9dAXYUD; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e9dAXYUD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fdP5S09d7z2yZN
	for <linux-aspeed@lists.ozlabs.org>; Sun, 22 Mar 2026 02:50:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16AAE442F7;
	Sat, 21 Mar 2026 15:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49918C19421;
	Sat, 21 Mar 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774108200;
	bh=kbn1WK1P0CLV3g9NxTzimggMcG6TtSf4XHKsAXdiH8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e9dAXYUDAsN9v4x1AadURqYSlSWa9Y7mxzZIDz25fB/CvA9Fyj7XD1b8lCM9cyKMb
	 F9rKRu8DkNZUirh+lv4LOJ/xxoxthjOn0mXZRo49DpIcI7mldLM7DvvygCk8RztYhv
	 d3Koaq1whNjtTUgG2lFGA6rfl0j3AqAiIQlxwwZeM2itrO1aQEDY6rdQayBSLFY4jV
	 KdQ+p/bWaAKz5+B1wT6Oz/LcZIZlM+DgBADkf6carn+i0Ct0isAYEjuwIxZYfTnf7C
	 +juQM6z2gUQ+iqOOkPzxxjzQnqohMQvNin2+WXg7FyqqK5FABtdD8feGRyz7b+oEYL
	 f89WoEbIKQ/Zw==
Date: Sat, 21 Mar 2026 15:49:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, morris_mao@aspeedtech.com
Subject: Re: [PATCH v3 3/4] iio: adc: aspeed: Replace mdelay() with fsleep()
 for ADC stabilization delay
Message-ID: <20260321154951.632ef7d9@jic23-huawei>
In-Reply-To: <ab0iDUp6t2LuGlAA@ashevche-desk.local>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
	<20260320-adc-v3-3-bc0eac04ef7c@aspeedtech.com>
	<ab0iDUp6t2LuGlAA@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:billy_tsai@aspeedtech.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:morris_mao@aspeedtech.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3732-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 36D052E636D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 12:31:41 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Fri, Mar 20, 2026 at 01:46:37PM +0800, Billy Tsai wrote:
> > The ADC stabilization delays in compensation mode and battery sensing
> > mode do not require atomic context. Using mdelay() here results in
> > unnecessary busy waiting.
> > 
> > Replace mdelay(1) with fsleep(1000) to allow the scheduler to run other
> > tasks while waiting for the ADC to stabilize.
> > 
> > Also fix a minor typo in the comment ("adc" -> "ADC").  
> 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
> 
> I haven't suggested the idea, I only suggested to use fsleep() for the purpose.
Dropped the tag.



> 



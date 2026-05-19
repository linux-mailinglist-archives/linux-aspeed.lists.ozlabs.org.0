Return-Path: <linux-aspeed+bounces-4097-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHr1OX/HDGrAlwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4097-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:26:39 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCF584A76
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmRJ2SgXz2xwH;
	Wed, 20 May 2026 06:26:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779210842;
	cv=none; b=YkJlt33vf65hE6qrMcJYyQbU0xqogyK8iy8/nFwHR83ctSWKYP6abHQhe4fPZciRV3MBKynA5cvdBzfAGQiivN6HM8rX4YpVe54yCaKZKmyR1zNpBCVACm2GCQ6vVTnMw5lfnx6Gwrqd4HlCdl3W1sg8+jpq/dPt0MCAYQvOUuUixeL/hV0pY9TXSBoWyOeJjJRjlFvejDcXw1LQbgjLOgWnt9AfElmAUigYtjyBO0hhWQdM/H5o45uiQAxBt5831jTvCqlZJ+rO8mK9T2uKABpgvsDcbzzeLU3xrdxvv/rjnr539gltW1yY/kAMyLN+lrZQsEBrqL2nC7/uJQpLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779210842; c=relaxed/relaxed;
	bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFS7gJ0KnHw2J8BHIRgs1EuKEdizgov1CKch0cNfEyH+g7uVza8Swe9Xj5SLYwxSm6dE6q3wUspRrWUiiMGuoGGmNWFR7nrXP2H/gYaSNn0alFlkp5WPBN4aOorUIKULOjNedNaKZpBoTb5FcdDbBH0UhNbI755eXtqAwHPrW4OBdpk7bjYxZuRS9xrhe9Kg2cUWhdqrxp7KeKOetl7m/PmU0O8cdqu8/JM+pukz+DVE9J+i0zsZR/y6pnIN+B+ZWf4l3vqa1OozC8VGtEK7GvtCyxIynQrVudggx+lJ5yeD6pTAJmqsKIQhn6cUQhC+ru95rFlbJ6+RsIv2ZIepaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSlNce/I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSlNce/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKh94325Fz2xqv
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 May 2026 03:13:59 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45562c41ec7so2378326f8f.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 19 May 2026 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779210831; x=1779815631; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
        b=TSlNce/IyZ/oA+3TPdvCaJhkiz883aS6xIoG2p9ECC2GN1BIO3/yj38A6ZjVRk0xrF
         0To8iddyNWAU/zhiITdy6by86dzfR4Smw/atIasQmsSZ2t7Shli1mD9qcxhYrbTeExRg
         wdcpHftkWRIpfNKIXN6qCJeGC1ZgEC54kxoAIkDXMmKQNDOAbxhQlYXbfDfUs0iETN39
         tWCIPNVtXf8e+XHn0V1DveII2jYJUfAKZhXxUCyXASghY/x7ktRA4P8Tw+NjWHaD3ruX
         TVutuqm5LkGXLcSq7GZrnLwZyQs/E2Ws4Swhpt9uevH68JocS7h6oCseqRtsBLZrnOJk
         keBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210831; x=1779815631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
        b=MAuuQJEfaqYhWTA8f7XrXTYuP1Goan4oRFg+DYUxB9d+POU1NO85SM5lajZF2t148U
         aALdqUhCFk2yQ7+ip0+yuQcp1AUnoSA5yN87S1qXkAlQfDsEUQSl6+phtsJIpP5LbRH1
         rDYokQSFiVc5owKvpikre+zEv6ritYxp6YE01VDn/GVtf3/dTPB1lGk/bQkrPCFUtQq2
         12RCTqZURK4Gy+0v3UcoQtBrz1136hQ/lnieoAYP2n+QZiZ+u0Ac4XC4E2t6rMG7PQhT
         wxzIpB4fTmh8M31obiVA/pxV3h4qXZrVin3PQ4PnHTe08khfNY7bxxWTBS7JxZJzsunT
         mKvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XypEFtHx2vuZ4wPpfBNnCPA/3/FnBwOyvnG0zEg1gX9tZL6z+OW+y3/j2UTFRkQVWDCZohYzFREgQ0qs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyj+t7qy+za50zFJfPaCdLutwFcAc1FzjNr8B+SekdWiuuYopsZ
	xN9HvHLurU1Lfe2lYovzob7V7B+W9yyrZs6hhnZc0OzwRRqgL9QRCpsK
X-Gm-Gg: Acq92OE1rYuyAxCnDP9kCemQdxlE0VpV9Emu7c13GlpHWQvM4+yHGNStQ4dKUBnse8k
	re4PhxdatVXID6LO5vHu2apwRHsp54r9ypqJm1Vay6Xd/oCvK2zgqNSIWO5ZF8r2KVhRkv8xjfZ
	K2CCr1Iz/pHovVHqp4mc4DINq6hH/9boLbqVdF+DdyMXuHJM1C2i42KPuKqin6A2N5MHP+6jk1F
	w+oMSAialCi+uwKpDxngkSolpLBUmo2GmQOw4nnsHGSvWV1Orwoau0/PmgPMvUBYerhhcLSZjXz
	Gus/LF2RpwaEX0J6YsMIPvfmskORIDspfo1Q8Ql10VGWb2VqIdSdiZYv8qt0nlVefzaiSnAoI1G
	XnkKSlyZTfaulo5DItOocIKMd/1yMkzTviHk7IcfQ/nKogCgpBWAKJf1521JvSkojajNsXmE5Jy
	EK5qEzoJf8T1aDb8iUUIWNMCIk0TGDLFoRzl4ZdDg4aMOyNinNsZq1ECBD8SEHEdRq
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48fe60ed7b7mr287651375e9.10.1779210830786;
        Tue, 19 May 2026 10:13:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e7c22d8b7sm17989013f8f.6.2026.05.19.10.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:13:50 -0700 (PDT)
Date: Tue, 19 May 2026 18:13:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, clg@kaod.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Message-ID: <20260519181348.777f7dc5@pumpkin>
In-Reply-To: <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
	<20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
	<659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:BMC-SW@aspeedtech.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-4097-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 1DCCF584A76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 12:03:51 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, May 18, 2026 at 05:57:08PM +0800, Chin-Ting Kuo wrote:
> 
> > -			while (k < cols && buf[i][k])
> > +			while (k < cols && buf[i * cols + k])  
> 
> This really needs () to make it clear what's going on; the precedence is
> well defined but not everyone is going to know that off the top of their
> head.

Come on, it's multiply and add - everyone is going to get that right.

-- David


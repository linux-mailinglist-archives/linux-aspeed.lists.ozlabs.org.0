Return-Path: <linux-aspeed+bounces-3643-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH2kCWYMsWldqAIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3643-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Mar 2026 07:32:06 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BCE25CE01
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Mar 2026 07:32:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fW1BB4pDLz30hP;
	Wed, 11 Mar 2026 17:32:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::f31" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773210722;
	cv=pass; b=ftyjpWpuw9DNVMiSPl5dHF8BkycY/xKqmN/r/o57wvpW8vB2ZlZczIHloJy7wzPxq5MxvAcfSi8CaaIxQu4c64pfco/C96wcsLOaW4alq25kCRL/a1DNu1WFmMjYkjbFpd6YkKQYAV/pk9nIueClwM4mOVDcQl3EYfIJav/QJROq2spaKsPCACWGkMFuSFxwliE6SJBPa4xNawBWrUhnzO97sxwnQ8hqRE/u8SqNhfNDr4/3xY8rPDMKofcshQuQCCc5IvzMDK8fEKXIY5WqHCUQdRtDPvLXCZL1m6FVgJzQJ6r6TDsRtoQgAsb/u0uNX5h1UW5zNXCvXuHSqHD7lw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773210722; c=relaxed/relaxed;
	bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kR3OaB4mA0KiLo5Z613oRa9WlXvrLRWY5AVFhTJyHYQnx0Y0TO6Xiapvd4yqqHPTziBKbub9VXGI3w8IuMzWZJx76HZgAvqGW7GkDmTYCqv1tL4Ib0Dk2pdzkDO0AsK/xPAC1PrR2wcKDvwb16LHaWuSm1PcDd3T2kOzWOQ9mPr8U0XXi4BPnAd5a5pirJvpHnZP18A5BP9/RjFLMYnGlfnWCQZXkDHfsL1PDr/p/XCabXAcr8CrAN+LCgburb9gM2R4MV5rcK7JnfLo/7WK/sausb6j1dlp7lFT/vqePdDtq/E0ROKf8YaFDkb3VAFdAhxtaAfb0oj/EexCUNwFLw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S2JxYAm/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S2JxYAm/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fW1B972Skz2xTh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Mar 2026 17:32:01 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-899d6b7b073so154174446d6.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Mar 2026 23:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773210719; cv=none;
        d=google.com; s=arc-20240605;
        b=H+8hv7lgqTHihZCy0fisDIZ9WcipbCRDIgWs1NmyFlEMpnFRzKALZpvVCSGpGwLe0m
         fhMgrtLkDB2B3X51BFTfH0ObPhWWktLVuYCxg/7f7O6ppCCaCKo1+rofryOlRZ8CjWLb
         fWj20Zor38Lqn9VpFeN+GrZGk9/UyxaNvJWxCnci+EnLhJ5QD5hayvNqXVzzfJgDRSd6
         /1OQVBnqGM+Yu0P5WmDly1nTutOOuATHsAFmwHT3WcDLizqSQ3QTBcEv/+159GlDECQD
         nKJO0oxGR3zxmC5QT0K8zaP/UJhO0i+V9DiX3+1hy9xP4bvIOB6nbV+GDVqAnXO2cBPh
         xBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=;
        fh=zdx60gxhjwdvjWegK+CfrB0n7Tmh7uZqFenBZ+B0bPY=;
        b=icDNzWtCaYkWvzwqurj43PpdKzvw8zz3kDEAv+SLmRVGUgIACSekXNzbfyFhnTDiI3
         u1eGLvEbrulTHy1lx6Wp7H6LZDFepBUSQ69QyVgLWpph2M4jxa/2hv2lkoYOe5mksiE3
         EOqYnPZkS8TmU2yrtybKQzt+xaoUuuMb/8/RXoNgH0HR1VNQvGcBY0v5OWv7c6juR7VA
         Niz1eVZHxXB8dCVnbYgP4Db1ZAX/2dRINcQIwNsIk2KwTxjZxrrxPeDeqcDV8M1kUtCj
         l/h9qJtbqOJoCKo/dvi2x1NTElvG3Vh3uLPPgAMjQxdSP1phtG9QsN9Bjnda/YBmJFNG
         MlgA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773210719; x=1773815519; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=;
        b=S2JxYAm/fgrQhwp3Xj8yO2un0wiEbJLG5DREm5DAxouh3kB9ENWDBG2IR5KqnZhJYg
         G3oxFC+iK3POne/ZjPDRw+Hfk9yrgvS9+pOL1X6PUZXV2znIGYZ4Dlt1OOdiEXG0ZXSb
         W2jDX8n8nkFM3ZzCiTw5SJYSDwJbypff+bQEswwhYMmM2BbYxYcf3mZk9Kq3QWvZsodC
         ioUTxBU5cZ/YhjHmm1kc/mqqAezRJ/1i8tlHQ6SA2bWfiUfQr7aNk8azmuT4n9iX6G40
         pybOZdFkfC62xf/gHtjCZt5ZpIVNJSyDk6w79mHroVLlFOrKwd2EP88hfxqBjOTXoykP
         QlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773210719; x=1773815519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=886lP/ymn9GmA/VWoJxMBnbcdeqM8sa1BFSxy7nE5AI=;
        b=lK88z0+aPHQZkEcgWzgT7q+BBM9w7qvPseXsFzptQ2gZIXD8N5hph+rw3nL+65n2Sf
         n4iRAv0hfRLMdCthyDuXNiBi9Urm57yW3Jiwk1b6YuBJaa/kFB4MV+77tVkZJOnlfCT6
         U4/nuf6vq+qYJFaivpEDlw0Qi1egWEhKqPpY5+Whmd9f0tLt99IGZR56NklUDtj+2pK9
         8e2b3ynX460hKw8aR6h5FHc/g0SIfG1djx2HQQg+rs4xpKGZzrs3kJIIGzN3s8mLft18
         V/+66I4uEp9MyhhqzoY4DcK4l8SiGg7xATwdfxBSaRAGDxA0pDViIBBbGzpXE60V2j9l
         /log==
X-Forwarded-Encrypted: i=1; AJvYcCX/xFuvW8rKN8YZetrZezpV92oJxw4WWbd/CdExGzusJurIJp6kZHPbUGfJFhrdnEGyboJvtng2YoGFvmY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+7P5zOS8mNcMcwut3J/cMUkL+xeRnHtvgTVRjtQKoSZHHpktk
	hhFF89z0uje5Ns9BbmeCOIlPGimVpB/DZdNJGdepYn2FGK4kjKcsToKf/xuBz3a/kq9qracQPbE
	uk2tdQDhfc89p7HdgjwSnAUVhibmhUGQ=
X-Gm-Gg: ATEYQzwUQ/0IF/tcw+n6mJLVXEuNzUDjqf9WQjX4HDpY92A4cicR8xQzz2DlkeDm0Si
	itJcjH19a15ojs34L/SfZUsFCp9VZlHVPVx3DnNi7uYO48nnkVVkJ9WOHkD2sE+dLbo0Kg9nrTU
	wMS3OQVR5v0o03mRcc3OQDaUpSKlJe7+4G3ULj7fvqtNMv6ftJEK8L1+4veYuo6u4h3mjzRpKPt
	+wkC7oHKGkG6kQRPestOfOCkJZoEVOLMAeiSq1ET11sw99PDpob5T6duqWsgaO19J09ACsFDrTN
	hFE77RCi
X-Received: by 2002:a05:6214:62d:b0:899:e919:2a7f with SMTP id
 6a1803df08f44-89a669996b4mr18786536d6.8.1773210719514; Tue, 10 Mar 2026
 23:31:59 -0700 (PDT)
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
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com> <3256b313-7671-4fda-9949-766906c344a7@lunn.ch>
In-Reply-To: <3256b313-7671-4fda-9949-766906c344a7@lunn.ch>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 11 Mar 2026 14:31:48 +0800
X-Gm-Features: AaiRm51ABuOL_zc6873VlOuNdm3hfQIVCU11Ut2lHruAF0li-NkozYrOk4XKKnY
Message-ID: <CAGfYmwUfKk5OrFzJRHyu6h-Jf-cqbxfh62wRmxwOL8K7VfFGfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Patrick Williams <patrick@stwcx.xyz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
	Potin Lai <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 37BCE25CE01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3643-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[potinlaipt@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:patrick@stwcx.xyz,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@quantatw.com,m:Roger.Kan@quantatw.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[potinlaipt@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,mail.gmail.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 9:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Feb 03, 2026 at 05:48:13PM +0800, Potin Lai wrote:
> > Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> > devices connected to the AST2620 BMC SoC.
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> > Changes in v2:
> > - change mac0 phy-mode to rgmii-id
>
> No other change? Was the previous version broken, and never tested? Is
> this version broken and not tested? Is the phy-mode ignored, which
> suggests something else is broken?
>
>      Andrew

Hi Andrew,

Sorry for the late reply.
Both "rgmii-id" and "rgmii-rxid" modes work fine without connection issues.
However, based on the scan testing we performed in U-Boot, "rgmii-id"
shows better coverage than "rgmii-rxid". Therefore, we decided to
switch to "rgmii-id".

Potin


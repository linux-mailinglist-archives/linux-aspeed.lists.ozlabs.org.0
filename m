Return-Path: <linux-aspeed+bounces-3707-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJYiBnx6uWnQGQIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3707-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Mar 2026 16:59:56 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791FB2AD6C8
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Mar 2026 16:59:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZxVX3rz0z2ySq;
	Wed, 18 Mar 2026 02:59:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::122f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773763188;
	cv=none; b=V1+0lJ6gedkgbd81eClG9GAD2tE/ZOwW/KICL9JT0CJGnN9DxJo3iusywk5p2pHtlyveFkFH9R4OfM+CSPF+6tW5ldiAJ0htUzT8FYdMl4ljrnhzCKllKWaIEKc/ts4U2Xk+b0d0lE7AM1EqMMEGOIqYyMMb3+PCiraBCa91Ue4I6l7jP2f1vLGqUR5bZYTJGiEvJwK5e/WXMkX2sEWpttqoeeDxcO4YQ99E9Wwm5qE6ZLZ9ef/ZwM6bHKaEmxIrs0prOGHhKnxlsEYfxZtiW7ydmTsh1Qd1F1Z1l2b3xWDyfjhYjli2uVpTFn/GdZVvSMMrYZUZ9hMdKx6zIWQghA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773763188; c=relaxed/relaxed;
	bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfe9O8Wn8ahpcFMAgg5ymvPUnGLJYruzoveBaOA0wSZWEyf2Ix9cmcCkP8FKdxobLQMD0yaoxuS13ngRyqJUNNLc4bBjwRIV9mSCjfTUBchvv410TTg0I//ibytyrJ0OE5pZ0L6ht8+B8IE5+La71GiQjJa4hcY7Leo6VkgEP3edeBvVYjPGjpnba7smANQ9gFCBdmhn1Bdj7AqAiLK4k4uva6lwhznTeP/uV+YEgK7wV/XZZV6CkgeY+I6dBW/rTbKPN1h0cHMttR+99heLNAElTB57/bIZKuC5TOd031FjFy6I000OzMBSeEHWPu5VMzxioO5WH1fcDM5tHdjwRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hz78I/6W; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hz78I/6W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122f.google.com (mail-dl1-x122f.google.com [IPv6:2607:f8b0:4864:20::122f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZxVW0Bjvz2ymg
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Mar 2026 02:59:46 +1100 (AEDT)
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1273349c56bso8905307c88.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Mar 2026 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763184; x=1774367984; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=;
        b=hz78I/6WyweiBMAEXwlLn7w9YA6/5FoH4JtFhWLEP84nku1+Rce3U47SNV64Y68RjH
         lRi+iuWngHLYrY4aHWnn74xsddPsPP/jEOSx9soTTKhz0vnQSxg3B1kNp5PKaNRiju0I
         2ksVRt0od/Rbu/y4A62w2ZDsMzQ7vAgw2kby8CO73vJVNibMiV5WZq26ZCJgAfCOUEi3
         WU7/enJUqJ5vPQb82/FIWCZotj4vDGiE4jB/t61h60MjIVwVeqnIGM7wnEuD3yijnoAn
         hHNVIDzRdkeKrgiCiiLNSVmAPmwC6KkK/IlyazFeXde4KLPAZb9Sj+T6HezN8UnAzk8z
         f1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763184; x=1774367984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=;
        b=mbT+2Us3WagmBOrfaip/Zc9jIe4G1s+j6TSB1A0ptm1QHNFhVfadbR9R3tp+VDtzPC
         orecb+27dErgXq51gshPsIHM+nZDV3lnrk+6n+A+bPJkvqJirmmVhH0oiGyule/Nm1LC
         srzR/Fo6XRvRKpq3RdvDPDw1C6FvESS+VgxDGG8mXodlT04/fcEnmPhGeNB0OvkcJQO4
         c19bzk+WnbCuCHWvDTScSWLu6q+SDfB0afOeZ0oT+4kSnymaVbO0bPsaPDXR9ym6F3Ng
         d4H8EjJ/M/XVjxTAECMyQllFOXhb7961ObwXA8NgxCILmDhYnDiqDVHjG9QTI3X1WRe8
         Aqkw==
X-Forwarded-Encrypted: i=1; AJvYcCXCj9ZgqE01CqwoY6wcec3l8lT4NBZi2gF+0k7+zaV+vipfhpJD+B25iEsl/08ltCheZPGE/O+64awn/8A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzuX6y6SwxhrCKBymnx/qNlCKub/mIqzIKzInEUVLJ/Uhnxs2Z7
	RFha8Hl6GZifIrKRjHPzrClNjrUNH559/A71qs7nHxOKIzQij0F5j0tR
X-Gm-Gg: ATEYQzxBA4D4QlN/Z3XzwkFGmtEY0dt/wHb8XDZTnKUgCKY3GPBwQf8B/KX1BpdW4AO
	mZU44MjLyqHtNNfbuIguMLO3lwZSoRL6zTlEljGBSDjxSdNXsWpNyhachSM9oz3BeWxQVdVRByS
	xN05/LMg2jisNh8uE3gHB7jdMrVJchMY3tb/+JG5ljvTpGxM+aDki+pFXRtTfuW1ftDccCxCtI/
	01hyyzuSbMSaytysdfnBscmzm0L2nLE1DbD3KjY6ccv0fUpZ85ewGQsbTxQQManw8E+rOaPi1Aa
	Lwra8aKVzisL3nPZdtLHckVrC8pUCwcOPCiVcztLQrSzzyV62smvX/LXLmSlKI8xH6+B0QluCJU
	Hls8LhmUEsfYhH9M/NiXaMe5IqRWUpCYRJBV2c3AQc/ho8DN4FRhoKNgeb4l0ACIo3ws85z90U0
	QVl/aOdKeAzWlZGI6cDtl0dThaQRjd1XKv4b4s
X-Received: by 2002:a05:7022:4387:b0:119:e569:f609 with SMTP id a92af1059eb24-1299ba1cb97mr18072c88.2.1773763183880;
        Tue, 17 Mar 2026 08:59:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f62991c7sm16442227c88.5.2026.03.17.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:59:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 08:59:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (aspeed-g6-pwm-tach): remove redundant driver
 remove callback
Message-ID: <351decf2-0a11-4f4c-a332-d5ae28c4c13f@roeck-us.net>
References: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3707-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:p.zabel@pengutronix.de,m:linux-hwmon@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[roeck-us.net];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-aspeed@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,roeck-us.net:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 791FB2AD6C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 10:33:24AM +0800, Billy Tsai wrote:
> Drops the remove callback as it only asserts reset and the probe already
> registers a devres action (devm_add_action_or_reset()) to call
> aspeed_pwm_tach_reset_assert().
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Applied.

Thanks,
Guenter


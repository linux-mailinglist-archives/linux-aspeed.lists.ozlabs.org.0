Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954E4DD2EB
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 03:12:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSFd6lRQz2xDM
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 13:12:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cLbT42cp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=singh.kuldeep87k@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cLbT42cp; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKKYN0RRfz2xrv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 08:10:31 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so6633554pjb.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Mar 2022 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5119qc3EtEQdDi8mG4lL3e8ynwtRHGtpJfUH9ad79BM=;
 b=cLbT42cpQNWZwjJlG1HnfdtUY2sEaO3MFC70NXE52i6GLZibAK6Lc+lPwcNb8Ix9pl
 KERlUCP/9Nu8tzePGfDRvKLgtyQpV9zbLKOP3MmzlIBK9OaRMaBz31mVX/VzB0K4+nEQ
 nvXspkRLxRJg5R3ZB2ih+tf0A9N34hPWap1kgA99fyVmUNOK/X7LkBFR81em8dCeb0om
 sdTaSTkk+0RIHwCQ7IDD3jDo4xa86MYRSCSwbYhAp2QWnirLfqKmhEgmwpa80PDQBZRl
 FjpOb12nlrmX0h9IV+bjY6i6u4jq69yZDk3XP4+M3sHvjwIcNg7KcB5b5zs1ukiJ5IVf
 tXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5119qc3EtEQdDi8mG4lL3e8ynwtRHGtpJfUH9ad79BM=;
 b=5+EIqTHhhRAs78SOoS96T+3wdOiGkOhQsNeA0r/51e6DAFx0S3ZRJ6hU+PiCEna5ig
 m8TdBMbR2DLAnrAFxBrCvXSELPmGnAg4lTWQnz5kk7uRt5xvgkey4raZW+OXuVPpR7St
 AdOAlG2n0lmv05EuKRRMRGbOfeFoIlCnjrvQ51ZNgkakIm8wrli1UYZ74FLCdIS3IT4w
 DBGLc7TSJaHLyjnWCH/7QG7WmaMA8k9ZrsFAP4HrC/uMyyCFAOc3GaeP66X3FJLKWFn7
 3CSVNKUhzIvm1bnhSMAMyVi1YVDx+pt6gPMf5UlMiIY444dY3AgdrExOZhW0HxqKJwuN
 4SPw==
X-Gm-Message-State: AOAM533VfKdejoqeWB7hDZrOZgMz0I5zCGLv9uwW0VblKllyi16C0PEm
 lCUCQQBCv1eM4kfaKUPZrDw=
X-Google-Smtp-Source: ABdhPJxXmdglkWtd/gJOeOPGrLtSGqZac2mfJTMtH5m81DtDv/2NIUQ7qhi00BvFz4PDEuRQCWqbZA==
X-Received: by 2002:a17:90b:2242:b0:1c6:80e3:71b6 with SMTP id
 hk2-20020a17090b224200b001c680e371b6mr6024596pjb.152.1647551429768; 
 Thu, 17 Mar 2022 14:10:29 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18]) by smtp.gmail.com with ESMTPSA id
 m11-20020a17090a3f8b00b001bc299e0aefsm10187305pjc.56.2022.03.17.14.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 14:10:29 -0700 (PDT)
Date: Fri, 18 Mar 2022 02:40:24 +0530
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: Remove arch timer clocks property
Message-ID: <20220317211024.GA99538@9a2d8922b8f1>
References: <20220317191527.96237-1-singh.kuldeep87k@gmail.com>
 <20220317191527.96237-4-singh.kuldeep87k@gmail.com>
 <87h77wxslh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h77wxslh.wl-maz@kernel.org>
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:56:13 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 07:54:34PM +0000, Marc Zyngier wrote:
> On Thu, 17 Mar 2022 19:15:26 +0000,
> Kuldeep Singh <singh.kuldeep87k@gmail.com> wrote:
> > 
> > Arch timer either require clock-frequency property or doesn't need to
> > specify clock at all in DT. In general, frequency can be determined
> > internally and in case of brokern firmwares, need to extend
> > clock-frequency to pass info to driver.
> 
> A clock frequency and a clock are not the same thing.

Yes Marc, That's what I have mentioned in commit description.

Driver uses "clock-frequency" property only and doesn't take inputs from
"clocks" property. So, any platform should refrain from defining such
entity at first place in DT. Binding also says the same i.e pass info
via "clock-frequency" property and no mention of "clocks".

> 
> > 
> > Aspeed BMC is the platform which defines clocks property, an invalid
> > entry which can be safely removed.
> 
> Safely removed? Says who? Have you tested this change?

Since "clocks" is never read by driver and driver incorporates
"clock-frequency" which was certainly not defined here, I believe this
reasoning is sufficient for my clause. As it's safe to remove an entry
which was never used.

Please note, it's just Aspeed BMC which had "clocks" defined, other
platforms which require input from DT have extended "clock-frequency"
property like I mentioned before.

I don't possess this platform physically,and did successfull compile
time testing. I have initally copied few Aspeed folks, they can help in
reviewing and confirming this.

> 
> > 
> > Moreover, clocks also matches incorrectly with the regex pattern.
> > Remove this entry altogether to fix it.
> > 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> NAK. That's not a reason to randomly butcher things.

I hope I explained my reasons above.

- Kuldeep

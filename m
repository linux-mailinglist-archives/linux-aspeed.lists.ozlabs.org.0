Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE242DB849
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Dec 2020 02:14:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwcbF3zVDzDqK5
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Dec 2020 12:14:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwX6F4LnYzDqCs;
 Wed, 16 Dec 2020 08:52:04 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D4C3AD87;
 Tue, 15 Dec 2020 21:52:00 +0000 (UTC)
Date: Tue, 15 Dec 2020 22:51:57 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: [RFC PATCH] treewide: remove bzip2 compression support
Message-ID: <20201215215157.GJ6564@kitsune.suse.cz>
References: <20201215190315.8681-1-alex_y_xu.ref@yahoo.ca>
 <20201215190315.8681-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215190315.8681-1-alex_y_xu@yahoo.ca>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Approved-At: Wed, 16 Dec 2020 12:13:43 +1100
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
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 torvalds@linux-foundation.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Dec 15, 2020 at 02:03:15PM -0500, Alex Xu (Hello71) wrote:
> bzip2 is either slower or larger than every other supported algorithm,
> according to benchmarks at [0]. It is far slower to decompress than any
> other algorithm, and still larger than lzma, xz, and zstd.
> 
> [0] https://lore.kernel.org/lkml/1588791882.08g1378g67.none@localhost/

Sounds cool. I wonder how many people will complain that their
distribution migrated to bzip2 but got stuck there and now new kernels
won't work on there with some odd tool or another :p

> @@ -212,11 +209,6 @@ choice
>  	  Compression speed is only relevant when building a kernel.
>  	  Decompression speed is relevant at each boot.
>  
> -	  If you have any problems with bzip2 or lzma compressed
> -	  kernels, mail me (Alain Knaff) <alain@knaff.lu>. (An older
> -	  version of this functionality (bzip2 only), for 2.4, was
> -	  supplied by Christian Ludwig)
> -
Shouldn't the LZMA part be preserved here?

Thanks

Michal

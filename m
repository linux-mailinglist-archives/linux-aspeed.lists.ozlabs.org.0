Return-Path: <linux-aspeed+bounces-2504-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625ACBE9A99
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Oct 2025 17:19:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp7lV70vMz3cYL;
	Sat, 18 Oct 2025 02:19:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760714358;
	cv=none; b=Q1IodTxkoyqx6ltJyv+BuvTjPalyi9BfZgdeG107nUz8szD1un5XV2/Oy+CWz9moyRwkCSTxyRj9yJiPRJ+ILYYZnCuSWEE5w3k/RbILOK34DKkUTYwJcF+xflPbSCF2k+gz0waGWgDayMuJKWeFTwMibupZ3iR9iJfAG6pvkWkkOxrxw2IiqjKqnj0haqwCNgTHRgmvo3gQW3EB/RlY8K/rI+zwpBb+qfHEwajeN2HjrHwsmcD83MavX68tfntXITtuqiKY9nsrUzjZby13VfxzfYb9SKQhU5ta0aq7lbV2hvpKk6VOiKNkr/XNukUck3HbUdVYh7NYmTnDdOu7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760714358; c=relaxed/relaxed;
	bh=HvFafWwrcKX1Mgad3ZplZOLBBSkBgF7muWWIqZuMyqU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LEIsH9pHVW+wTwtd8Nu38yRGV4G26hDClTNhjrjgTQMLdMq1fDTRd9+nMP3wSjDLUuuNbVZku6CQ88VqRmHIaW+IlUcI3Ofhy9uYtN6lSH5hFJyv+CbaJF2G3VOGCwk+jJoO1ttRV4LOOQmIjOmESBnOKpbF69fYgnI1LxC673J0ej7cUzEGF2MBxzO9fi8V2yOd4uY1QYh/VqUEB21GxZZx2hcJLiJmZxkuaTFaM/U6NFKqf75YJPWdDwJWJOvNmmolqDEsPqrktc/hVJ1/8J31t6Do/Jl2VUVhowgBYzwY25s9k2maVKc4RpLnpwdJLF+GFS8VRyANxolcQSblqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DBJGnQw2; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DBJGnQw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp7lT6gjzz3cYG
	for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Oct 2025 02:19:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3975B4B60C;
	Fri, 17 Oct 2025 15:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98656C4CEE7;
	Fri, 17 Oct 2025 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760714355;
	bh=Jkoxv5jBiXwh3/Xam1mL3Rb7nwPNp22HhVGe+o5k1sY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DBJGnQw29zw6lCVTKtpBhIgSG7SMX4VZD9MlmLUEPUBMWipU3K8+xfy/xqlmxz8Qi
	 mLxaq5V5Z7Et2fOTaRuUiiEspXQRrhIZZJ9xRqScULqTAgvTGjzSlFIQWaMNs3MR+A
	 dKeaol6kFcz4lkdW7DFiMk5bbpEA1Dgh/SH6u6TIXDXdKDqoochxfVVvitpFaYDKlL
	 bULb536qkalBIUpX9fU7Dk2QB8zCg/3nMjXL1nlc2Ddg/ayrRE+8/4gAavHoyhpk1Y
	 0fREHXWYLfsbUhrNzXSgnVS+UpYAnpmQOfquXa1v8/EjnKyNDqrbCpraPpvMaG8lGT
	 yY3YmE4+sr2qw==
Date: Fri, 17 Oct 2025 08:19:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller
 <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Johannes
 Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, David Laight
 <david.laight.linux@gmail.com>, Vincent Mailhol
 <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, qat-linux@intel.com,
 linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <20251017081912.2ad26705@kernel.org>
In-Reply-To: <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
References: <cover.1739540679.git.geert+renesas@glider.be>
	<2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
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

On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> 
> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by consolidating them in
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures.
> 
> This is deliberately not merged into the existing FIELD_{GET,PREP}()
> macros, as people expressed the desire to keep stricter variants for
> increased safety, or for performance critical paths.

We already have helpers for this, please just don't know they exist :/

The "const" version of the helpers are specifically defined to work
on masks generated with BIT() and GENMASK(). If the mask is not
constant we should expect it to have a well defined width.

I strongly prefer that we do this instead and convert the users to
the fixed-width version:

---->8----------------

Subject: bitfield: open code the fixed-width non-const helpers so that people see them

There is a number of useful helpers defined in bitfield.h but
they are mostly invisible to the reader because they are all
generated by macros. Open code the 32b versions (which are
most commonly used) to give developers a chance to discover them.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 include/linux/bitfield.h | 82 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 5355f8f806a9..0356e535f37d 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -173,6 +173,11 @@
 		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
 	})
 
+/* Non-constant, fixed-width helpers follow
+ * Open code u32 and le32 versions for documentation / visibility,
+ * be32 and other widths exist but are generated using macroes.
+ */
+
 extern void __compiletime_error("value doesn't fit into mask")
 __field_overflow(void);
 extern void __compiletime_error("bad bitfield mask")
@@ -188,6 +193,81 @@ static __always_inline u64 field_mask(u64 field)
 	return field / field_multiplier(field);
 }
 #define field_max(field)	((typeof(field))field_mask(field))
+
+/**
+ * u32_encode_bits() - prepare a u32 bitfield element (non-const)
+ * @v: value to put in the field
+ * @field: shifted mask defining the field's length and position
+ *
+ * Equivalent of FIELD_PREP() for u32, field does not have to be constant.
+ *
+ * Note that the helper is available for other field widths (generated below).
+ */
+static __always_inline __u32 u32_encode_bits(u32 v, u32 field)
+{
+	if (__builtin_constant_p(v) && (v & ~field_mask(field)))
+		__field_overflow();
+	return ((v & field_mask(field)) * field_multiplier(field));
+}
+
+/**
+ * u32_replace_bits() - change a u32 bitfield element (non-const)
+ * @old: old u32 value to modify
+ * @val: value to put in the field
+ * @field: shifted mask defining the field's length and position
+ *
+ * Remove the current contents of the @field in @old and set it to @new.
+ *
+ * Note that the helper is available for other field widths (generated below).
+ */
+static __always_inline __u32 u32_replace_bits(__u32 old, u32 val, u32 field)
+{
+	return (old & ~(field)) | u32_encode_bits(val, field);
+}
+
+/**
+ * u32_get_bits() - get u32 bitfield element (non-const)
+ * @v: value to extract the field from
+ * @field: shifted mask defining the field's length and position
+ *
+ * Extract the value of the field and shift it down.
+ *
+ * Note that the helper is available for other field widths (generated below).
+ */
+static __always_inline u32 u32_get_bits(__u32 v, u32 field)
+{
+	return ((v) & field) / field_multiplier(field);
+}
+
+static __always_inline void u32p_replace_bits(__u32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~(field)) | u32_encode_bits(val, field);
+}
+
+static __always_inline __le32 le32_encode_bits(u32 v, u32 field)
+{
+	if (__builtin_constant_p(v) && (v & ~field_mask(field)))
+		__field_overflow();
+	return cpu_to_le32((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline __le32 le32_replace_bits(__le32 old, u32 val, u32 field)
+{
+	return (old & ~cpu_to_le32(field)) | le32_encode_bits(val, field);
+}
+
+static __always_inline void le32p_replace_bits(__le32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~cpu_to_le32(field)) | le32_encode_bits(val, field);
+}
+
+static __always_inline u32 le32_get_bits(__le32 v, u32 field)
+{
+	return (le32_to_cpu(v) & field) / field_multiplier(field);
+}
+
+/* Auto-generate bit ops for other field width and endian combination */
+
 #define ____MAKE_OP(type,base,to,from)					\
 static __always_inline __##type __must_check type##_encode_bits(base v, base field)	\
 {									\
@@ -215,7 +295,7 @@ static __always_inline base __must_check type##_get_bits(__##type v, base field)
 	____MAKE_OP(u##size,u##size,,)
 ____MAKE_OP(u8,u8,,)
 __MAKE_OP(16)
-__MAKE_OP(32)
+____MAKE_OP(be32,u32,cpu_to_be32,be32_to_cpu) /* Other 32b types open coded */
 __MAKE_OP(64)
 #undef __MAKE_OP
 #undef ____MAKE_OP
-- 
2.51.0


